/*
    FreeRTOS V7.3.0 - Copyright (C) 2012 Real Time Engineers Ltd.


    ***************************************************************************
     *                                                                       *
     *    FreeRTOS tutorial books are available in pdf and paperback.        *
     *    Complete, revised, and edited pdf reference manuals are also       *
     *    available.                                                         *
     *                                                                       *
     *    Purchasing FreeRTOS documentation will not only help you, by       *
     *    ensuring you get running as quickly as possible and with an        *
     *    in-depth knowledge of how to use FreeRTOS, it will also help       *
     *    the FreeRTOS project to continue with its mission of providing     *
     *    professional grade, cross platform, de facto standard solutions    *
     *    for microcontrollers - completely free of charge!                  *
     *                                                                       *
     *    >>> See http://www.FreeRTOS.org/Documentation for details. <<<     *
     *                                                                       *
     *    Thank you for using FreeRTOS, and thank you for your support!      *
     *                                                                       *
    ***************************************************************************


    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation AND MODIFIED BY the FreeRTOS exception.
    >>>NOTE<<< The modification to the GPL is included to allow you to
    distribute a combined work that includes FreeRTOS without being obliged to
    provide the source code for proprietary components outside of the FreeRTOS
    kernel.  FreeRTOS is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details. You should have received a copy of the GNU General Public
    License and the FreeRTOS license exception along with FreeRTOS; if not it
    can be viewed here: http://www.freertos.org/a00114.html and also obtained
    by writing to Richard Barry, contact details for whom are available on the
    FreeRTOS WEB site.

    1 tab == 4 spaces!

    http://www.FreeRTOS.org - Documentation, latest information, license and
    contact details.

    http://www.SafeRTOS.com - A version that is certified for use in safety
    critical systems.

    http://www.OpenRTOS.com - Commercial support, development, porting,
    licensing and training services.
*/

/******************************************************************************
 * The FreeRTOS+IO and FreeRTOS+CLI features mentioned in these comments are
 * documented on the following two URLs:
 * http://www.FreeRTOS.org/FreeRTOS-Plus/FreeRTOS_Plus_IO/
 * http://www.FreeRTOS.org/FreeRTOS-Plus/FreeRTOS_Plus_CLI/
 *
 * It is essential that jumpers are set correctly.  The required jumper
 * settings are pictured on the documentation page for this demo, which
 * can be located from the following URL:
 * http://www.FreeRTOS.org/FreeRTOS-Plus/FreeRTOS_Plus_IO/Featured-FreeRTOS_Plus_IO_Demos.shtml
 ******************************************************************************
 *
 * This demo provides the following functionality:
 *
 * --- Command Console ---
 * FreeRTOS+IO and FreeRTOS+CLI are used to create a command console. UART3 is
 * used for input and output.
 *
 * The FreeRTOS+IO zero copy transfer mode is used to transmit characters, and
 * the interrupt driven character queue transfer mode is used to receive
 * characters.
 *
 * The application registers the following commands:
 *
 *	+ "echo-parameters".  This command accepts a variable number of parameters.
 *    Each parameter entered is echoed back individually.
 *
 *	+ "echo-three-parameters".  This command is similar to "echo-parameters",
 *    but will only accept exactly three parameters.
 *
 *  + "task-stats".  This command displays a table that includes a line for each
 *    executing task.  The table displays information including the task state,
 *    and the task's stack high water mark.  (the closer the stack high water
 *    mark value is to zero the closer the task has come to overflowing its
 *    stack).
 *
 *	+ "run-time-stats".  This command also displays a table that also includes
 *    a line for each executing task.  This time the table displays the amount
 *    of time each task has spent in the "Running" state (actually executing).
 *    Both absolute and percentage times are shown.  See
 *    http://www.freertos.org/rtos-run-time-stats.html
 *
 *	+ "create-task".  This command takes a single numerical parameter.  It
 *     creates a new task and passes the command line parameter into the task as
 *     the task parameter.  The task that is created displays the parameter value
 *     on the command console.  The "task-stats" command can be used both before
 *     and after executing the "create-task" command to see the newly created
 *	   task appear in the table of running tasks.
 *
 *	+ "delete-task".  This command deletes the task that was created by the
 *    "create-task" command.
 *
 *
 * By default, UART3 is set to 115200 baud, no start bits, 8 data bits and 1
 * stop bit. UART3 is routed, via a UART to USB converter, to the micro USB
 * connector marked X3 on the LPCXpresso base board.
 *
 * --- Display Driver ---
 * FreeRTOS+IO is used to implement a display driver for the OLED display.
 * The OLED is configured for I2C operation, and uses the I2C2 peripheral.
 *
 * The example demonstrates the I2C port being used in the polled and
 * interrupt driven zero copy transfer modes.
 *
 * --- Serial EEPROM Interface ---
 * FreeRTOS+IO is used to write to, then read back from, an EEPROM that is
 * connected to the I2C2 peripheral.
 *
 * The example demonstrates the I2C port being used in the polled and interrupt
 * driven zero copy transfer modes to write to the EEPROM, and the polled and
 * interrupt driven circular buffer transfer modes to read back from the
 * EEPROM.
 *
 * --- 7-Segment Display ---
 * FreeRTOS+IO is used with an SPI peripheral in the polled transfer mode to
 * periodically write an incrementing number to a 7-segment	display.
 *
 * --- GPIO ---
 * FreeRTOS software timers are used to periodically toggle the multi-coloured
 * LEDs.
 */


/* Standard includes. */
#include <string.h>

/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"

/* Example includes. */
#include "GPIO-output-and-software-timers.h"
#include "UART-interrupt-driven-command-console.h"
#include "UART-operation-modes-test.h"
#include "SPI-writes-to-7-seg-display.h"
#include "I2C-coordinator.h"
#include "FreeRTOS_CLI.h"

/* Library includes. */
#include "LPC17xx.h"

/* The CLI commands are defined in CLI-commands.c. */
void vRegisterCLICommands( void );

/*-----------------------------------------------------------*/

/* Used in the run time stats calculations. */
static uint32_t ulClocksPer10thOfAMilliSecond = 0UL;

/*-----------------------------------------------------------*/

int main( void )
{
	/* The examples assume that all priority bits are assigned as preemption
	priority bits. */
	NVIC_SetPriorityGrouping( 0UL );

	/* Start the timers that demonstrate FreeRTOS software timers and basic
	GPIO functionality. */
	vGPIOSoftwareTimersStart();

	/* Start the tasks that implements the command console on the UART, as
	described above. */
	vUARTCommandConsoleStart();

	/* Start the task that demonstrates the SSP port being used in SPI mode to
	write to the 7 segment display. */
	vSPIWriteTaskStart();

	/* Start the task that uses an I2C peripheral to communicate with the
	OLED and the EEPROM. */
	vI2CTaskStart();

	/* Register two command line commands to show task stats and run time stats
	respectively. */
	vRegisterCLICommands();

	/* Start the FreeRTOS scheduler. */
	vTaskStartScheduler();

	/* The following line should never execute.  If it does, it means there was
	insufficient FreeRTOS heap memory available to create the Idle and/or timer
	tasks.  See the memory management section on the http://www.FreeRTOS.org web
	site for more information. */
	for( ;; );
}
/*-----------------------------------------------------------*/

void vMainConfigureTimerForRunTimeStats( void )
{
	/* How many clocks are there per tenth of a millisecond? */
	ulClocksPer10thOfAMilliSecond = configCPU_CLOCK_HZ / 10000UL;
}
/*-----------------------------------------------------------*/

uint32_t ulMainGetRunTimeCounterValue( void )
{
uint32_t ulSysTickCounts, ulTickCount, ulReturn;
const uint32_t ulSysTickReloadValue = ( configCPU_CLOCK_HZ / configTICK_RATE_HZ ) - 1UL;
volatile uint32_t * const pulCurrentSysTickCount = ( ( volatile uint32_t *) 0xe000e018 );
volatile uint32_t * const pulInterruptCTRLState = ( ( volatile uint32_t *) 0xe000ed04 );
const uint32_t ulSysTickPendingBit = 0x04000000UL;

	/* NOTE: There are potentially race conditions here.  However, it is used
	anyway to keep the examples simple, and to avoid reliance on a separate
	timer peripheral. */


	/* The SysTick is a down counter.  How many clocks have passed since it was
	last reloaded? */
	ulSysTickCounts = ulSysTickReloadValue - *pulCurrentSysTickCount;

	/* How many times has it overflowed? */
	ulTickCount = xTaskGetTickCountFromISR();

	/* Is there a SysTick interrupt pending? */
	if( ( *pulInterruptCTRLState & ulSysTickPendingBit ) != 0UL )
	{
		/* There is a SysTick interrupt pending, so the SysTick has overflowed
		but the tick count not yet incremented. */
		ulTickCount++;

		/* Read the SysTick again, as the overflow might have occurred since
		it was read last. */
		ulSysTickCounts = ulSysTickReloadValue - *pulCurrentSysTickCount;
	}

	/* Convert the tick count into tenths of a millisecond.  THIS ASSUMES
	configTICK_RATE_HZ is 1000! */
	ulReturn = ( ulTickCount * 10UL ) ;

	/* Add on the number of tenths of a millisecond that have passed since the
	tick count last got updated. */
	ulReturn += ( ulSysTickCounts / ulClocksPer10thOfAMilliSecond );

	return ulReturn;
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( xTaskHandle pxTask, signed char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationMallocFailedHook( void )
{
	/* vApplicationMallocFailedHook() will only be called if
	configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
	function that will get called if a call to pvPortMalloc() fails.
	pvPortMalloc() is called internally by the kernel whenever a task, queue,
	timer or semaphore is created.  It is also called by various parts of the
	demo application.  If heap_1.c or heap_2.c are used, then the size of the
	heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
	FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
	to query the size of free heap space that remains (although it does not
	provide information on how the remaining heap might be fragmented). */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

