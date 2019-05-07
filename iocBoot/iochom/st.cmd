#!../../bin/rhel6-x86_64/hom

< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/db")

cd "${TOP}"

## Register all support components
dbLoadDatabase("dbd/hom.dbd")
hom_registerRecordDeviceDriver(pdbbase)

## Port config/debugging
drvAsynIPPortConfigure("ETH0",lcls-llrfhom.acc.jlab.org:23)
#asynSetTraceMask("ETH0",-1,0x09)
#asynSetTraceIOMask("ETH0",-1,0x02)

drvAsynIPPortConfigure("ETH1",lcls-llrfpwr1.acc.jlab.org:23)
#asynSetTraceMask("ETH1",-1,0x09)
#asynSetTraceIOMask("ETH1",-1,0x02)

drvAsynIPPortConfigure("ETH2",lcls-llrfpwr2.acc.jlab.org:23)
#asynSetTraceMask("ETH2",-1,0x09)
#asynSetTraceIOMask("ETH2",-1,0x02)

## Load record instances
dbLoadTemplate("db/hom.substitutions")

cd "${TOP}/iocBoot/${IOC}"
< save_restore.cmd
dbl > pv.list
iocInit

## autosave startup
## Handle autosave 'commands' contained in loaded databases.
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=xxx:")
create_monitor_set("info_settings.req", 30, "P=xxx:")

## Load defaults
# Map powerhead offsets
dbpf("HOM:PWR1:POWER_PEAK.INPB", "HOM:SW2:OFFSET")
dbpf("HOM:PWR1:POWER_AVG.INPB",  "HOM:SW2:OFFSET")
dbpf("HOM:PWR2:POWER_PEAK.INPB", "HOM:SW5:OFFSET")
dbpf("HOM:PWR2:POWER_AVG.INPB",  "HOM:SW5:OFFSET")

