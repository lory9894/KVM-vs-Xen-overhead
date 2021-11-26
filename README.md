# KVM-vs-Xen-overhead
This is the thesis with which I concluded my bachelor degree in computer science at the University of Turin. I'm sharing the results just in case someone might find them intereseting or useful for their future research.

## Abstract ##
Virtualization is expanding in fields where tracing is crucial, not only in software development but for quality certification too.
In those systems the computational power is low, therefore it is really important to keep the tracing overhead as low as possible. 
This thesis analyzes how tracing impacts two different hypervisors: Xen and KVM. 
Different benchmarks were run with the aim to stress both the host system and the virtualized guest, using Ftrace and Xentrace as tracing frameworks.
The benchmarks were run on every combination of host and guest with enabled and disabled tracing, generating the results that were later analyzed.

## Configuration ##

* Host’s Linux kernel: 5.14.9 (distro openSUSE Tumbleweed)
* Xen Hypervisor: 4.15.0
* Virtual machine manager: 3.2.0
* Guest’s Linux kernel: 5.14.9 (distro openSUSE Tumbleweed)
* MMTest: 0.24

All tests were run using [MMtest](https://github.com/gormanm/mmtests "MMtest") with different configuration (shared on this repo) 
