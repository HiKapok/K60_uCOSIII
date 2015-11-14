################################################################################
# �Զ����ɵ��ļ�����Ҫ�༭��
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../KinetisDrivers/KinetisOperate.c" \
"../KinetisDrivers/KinetisStart.c" \
"../KinetisDrivers/KinetisVectors.c" \

C_SRCS += \
../KinetisDrivers/KinetisOperate.c \
../KinetisDrivers/KinetisStart.c \
../KinetisDrivers/KinetisVectors.c \

OBJS += \
./KinetisDrivers/KinetisOperate.obj \
./KinetisDrivers/KinetisStart.obj \
./KinetisDrivers/KinetisVectors.obj \

C_DEPS += \
./KinetisDrivers/KinetisOperate.d \
./KinetisDrivers/KinetisStart.d \
./KinetisDrivers/KinetisVectors.d \

OBJS_QUOTED += \
"./KinetisDrivers/KinetisOperate.obj" \
"./KinetisDrivers/KinetisStart.obj" \
"./KinetisDrivers/KinetisVectors.obj" \

OBJS_OS_FORMAT += \
./KinetisDrivers/KinetisOperate.obj \
./KinetisDrivers/KinetisStart.obj \
./KinetisDrivers/KinetisVectors.obj \


# Each subdirectory must supply rules for building sources it contributes
KinetisDrivers/KinetisOperate.obj: ../KinetisDrivers/KinetisOperate.c
	@echo '���ڹ����ļ��� $<'
	@echo '���ڵ��ã� ARM Compiler'
	"$(ARM_ToolsDirEnv)/mwccarm" -gccinc @@"KinetisDrivers/KinetisOperate.args" -o "KinetisDrivers/KinetisOperate.obj" -c "$<" -MD -gccdep
	@echo '�ѽ��������� $<'
	@echo ' '

KinetisDrivers/%.d: ../KinetisDrivers/%.c
	@echo '�������������ļ��� $@'
	
	@echo ' '

KinetisDrivers/KinetisStart.obj: ../KinetisDrivers/KinetisStart.c
	@echo '���ڹ����ļ��� $<'
	@echo '���ڵ��ã� ARM Compiler'
	"$(ARM_ToolsDirEnv)/mwccarm" -gccinc @@"KinetisDrivers/KinetisStart.args" -o "KinetisDrivers/KinetisStart.obj" -c "$<" -MD -gccdep
	@echo '�ѽ��������� $<'
	@echo ' '

KinetisDrivers/KinetisVectors.obj: ../KinetisDrivers/KinetisVectors.c
	@echo '���ڹ����ļ��� $<'
	@echo '���ڵ��ã� ARM Compiler'
	"$(ARM_ToolsDirEnv)/mwccarm" -gccinc @@"KinetisDrivers/KinetisVectors.args" -o "KinetisDrivers/KinetisVectors.obj" -c "$<" -MD -gccdep
	@echo '�ѽ��������� $<'
	@echo ' '


