#!/bin/bash
name="HACKBENCHPIPES"

sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-workload-hackbench-process-pipes -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-workload-hackbench-process-pipes -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*

name="SCHBENCH"

sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-scheduler-schbench -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-scheduler-schbench -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*
name="SYSBENCHCPU"


sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-scheduler-sysbench-cpu -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-scheduler-sysbench-cpu -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*
name="CYCLICNONE"


sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-workload-cyclictest-fine-none -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-workload-cyclictest-fine-none -c config_notrace "$name"_XENTRACE_ALL


sudo rm work-*

name="CYCLICHACKBENCH"


sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-workload-cyclictest-fine-hackbench -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-workload-cyclictest-fine-hackbench -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*
name="SYSBENCHTHREAD"


sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-scheduler-sysbench-thread -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-scheduler-sysbench-thread -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*
name="UNIXBENCH"


sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-workload-unixbench -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-workload-unixbench -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*
name="UNIXBENCHIO"


sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace -c configs/config-workload-unixbench-io -c config_notrace "$name"_XENTRACE
sudo ./run-kvm.sh -k -p -L -C host_config_common -C config_xentrace_all -c configs/config-workload-unixbench-io -c config_notrace "$name"_XENTRACE_ALL

sudo rm work-*
sudo shutdown -P now
