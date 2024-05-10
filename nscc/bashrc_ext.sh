# cat bashrc_ext.sh >> ~/.bashrc
export MODULEPATH=/opt/cray/pe/perftools/22.04.0/modulefiles:/opt/cray/pe/modulefiles:/opt/cray/modulefiles:/opt/modulefiles:/opt/cray/pe/craype-targets/default/modulefiles:/app/apps/modulefiles:/app/libs/modulefiles
module () 
{ 
    eval `/opt/cray/pe/modules/3.2.11.6/bin/modulecmd bash $*`
}

module load git/2.39.2