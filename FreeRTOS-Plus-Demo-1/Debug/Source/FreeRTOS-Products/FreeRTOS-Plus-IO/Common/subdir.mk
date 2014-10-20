################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_DriverInterface.c \
/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_IOUtils.c \
/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CharQueueTxAndRx.c \
/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CircularBufferRx.c \
/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_ZeroCopyTx.c 

OBJS += \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_DriverInterface.o \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_IOUtils.o \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CharQueueTxAndRx.o \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CircularBufferRx.o \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_ZeroCopyTx.o 

C_DEPS += \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_DriverInterface.d \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_IOUtils.d \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CharQueueTxAndRx.d \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CircularBufferRx.d \
./Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_ZeroCopyTx.d 


# Each subdirectory must supply rules for building sources it contributes
Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_DriverInterface.o: /home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_DriverInterface.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC17xx -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Device/LPC17xx/SupportedBoards" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-CLI" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/portable/GCC/ARM_CM3" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/include" -I"/home/nishad/fbaseboard_workspace/CMSISv2p00_LPC17xx/inc" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source/Examples/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source" -I"/home/nishad/fbaseboard_workspace/lpc17xx.cmsis.driver.library/Include" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -Wextra -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_IOUtils.o: /home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/FreeRTOS_IOUtils.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC17xx -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Device/LPC17xx/SupportedBoards" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-CLI" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/portable/GCC/ARM_CM3" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/include" -I"/home/nishad/fbaseboard_workspace/CMSISv2p00_LPC17xx/inc" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source/Examples/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source" -I"/home/nishad/fbaseboard_workspace/lpc17xx.cmsis.driver.library/Include" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -Wextra -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CharQueueTxAndRx.o: /home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CharQueueTxAndRx.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC17xx -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Device/LPC17xx/SupportedBoards" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-CLI" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/portable/GCC/ARM_CM3" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/include" -I"/home/nishad/fbaseboard_workspace/CMSISv2p00_LPC17xx/inc" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source/Examples/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source" -I"/home/nishad/fbaseboard_workspace/lpc17xx.cmsis.driver.library/Include" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -Wextra -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CircularBufferRx.o: /home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_CircularBufferRx.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC17xx -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Device/LPC17xx/SupportedBoards" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-CLI" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/portable/GCC/ARM_CM3" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/include" -I"/home/nishad/fbaseboard_workspace/CMSISv2p00_LPC17xx/inc" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source/Examples/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source" -I"/home/nishad/fbaseboard_workspace/lpc17xx.cmsis.driver.library/Include" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -Wextra -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Source/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_ZeroCopyTx.o: /home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Common/IOUtils_ZeroCopyTx.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC17xx -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Device/LPC17xx/SupportedBoards" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-IO/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS-Plus-CLI" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/portable/GCC/ARM_CM3" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Products/FreeRTOS/include" -I"/home/nishad/fbaseboard_workspace/CMSISv2p00_LPC17xx/inc" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source/Examples/Include" -I"/home/nishad/fbaseboard_workspace/FreeRTOS-Plus-Demo-1/Source" -I"/home/nishad/fbaseboard_workspace/lpc17xx.cmsis.driver.library/Include" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -Wextra -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


