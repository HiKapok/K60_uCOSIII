################################################################################
# �Զ����ɵ��ļ�����Ҫ�༭��
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../Sources/main.c" \

C_SRCS += \
../Sources/main.c \

OBJS += \
./Sources/main.obj \

C_DEPS += \
./Sources/main.d \

OBJS_QUOTED += \
"./Sources/main.obj" \

OBJS_OS_FORMAT += \
./Sources/main.obj \


# Each subdirectory must supply rules for building sources it contributes
Sources/main.obj: ../Sources/main.c
	@echo '���ڹ����ļ��� $<'
	@echo '���ڵ��ã� ARM Compiler'
	"$(ARM_ToolsDirEnv)/mwccarm" -gccinc @@"Sources/main.args" -o "Sources/main.obj" -c "$<" -MD -gccdep
	@echo '�ѽ��������� $<'
	@echo ' '

Sources/%.d: ../Sources/%.c
	@echo '�������������ļ��� $@'
	
	@echo ' '


