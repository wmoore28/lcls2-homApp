TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Build the IOC application
PROD_IOC = hom

# hom.dbd will be created and installed
DBD += hom.dbd

# hom.dbd will include these files:
hom_DBD += base.dbd
hom_DBD += asSupport.dbd
hom_DBD += stream.dbd
hom_DBD += drvAsynIPPort.dbd
hom_DBD += asyn.dbd

# hom_registerRecordDeviceDriver.cpp derives from hom.dbd
hom_SRCS += hom_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
hom_SRCS_DEFAULT += homMain.cpp
hom_SRCS_vxWorks += -nil-

USR_SYS_LIBS += pcre

# Link in the code from our support library
hom_LIBS += stream
hom_LIBS += autosave
hom_LIBS += asyn

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
#ifneq ($(SNCSEQ),)
    # Build sncExample into homSupport
#    sncExample_SNCFLAGS += +r
#    hom_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
#    homSupport_SRCS += sncExample.stt
#    homSupport_LIBS += seq pv
#    hom_LIBS += seq pv

    # Build sncProgram as a standalone program
#    PROD_HOST += sncProgram
#    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
#    sncProgram_SRCS += sncProgram.st
#    sncProgram_LIBS += seq pv
#    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
#endif

# Finally link IOC to the EPICS Base libraries
hom_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

