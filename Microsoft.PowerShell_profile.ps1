# slimfa
# microverse-power
# froczh
# neko
# craver
# blue-owl
# clean-detailed
# lambdageneration
oh-my-posh init pwsh --config 'C:\Users\frede\AppData\Local\Programs\oh-my-posh\themes\froczh.omp.json' | Invoke-Expression

function gcmake {
    param([String]$Dir)
    if (-Not $env:IS_MSVC_SET) {
        return
    }
    if (-Not $env:IS_MINGW_SET) {
        return
    }
    cmake $Dir -G "Unix Makefiles"
}

function activate ($var) {
    Invoke-Expression (& "$PROFILE/../PathModifier.exe" $var)
}

function VsVars {
    if ($env:IS_MSVC_SET) {
        return
    }
    $env:IS_MSVC_SET = $true
	& "E:\Aplicativos\VisualStudio\IDE\Common7\Tools\Launch-VsDevShell.ps1" -SkipAutomaticLocation -Arch amd64
}

#function mingw {
#    if($env:IS_MINGW_SET) {
#        return
#    }
#    $env:IS_MINGW_SET = $true
#    $env:PATH += ";$env:PATH_MINGW"
#    Write-Output("MinGW env activated")
#}
#
#function EspVars {
#    if($env:IS_ESPVARS_SET) {
#        return
#    }
#    $env:IS_ESPVARS_SET = $true
#    Write-Output("ESP env activated")
#    $env:PATH=$env:PATH+";$env:PATH_ESP"
#}
#
#function AdaVars {
#    if($env:IS_ADAVARS_SET) {
#        return
#    }
#    $env:IS_ADAVARS_SET = $true
#    Write-Output("ADA env activated")
#    $env:PATH=$env:PATH_ADA_LS+";"+$env:PATH_ADA+";"+$env:PATH
#}
#
#function ll {
#    ls -Force
#}
#
function live {
    cd "E:/DEV/Live"
}
#
#function Latex {
#    if($env:IS_LATEXVARS_SET) {
#        return
#    }
#    $env:IS_LATEXVARS_SET = $true
#    Write-Output("LATEX env activated")
#    $env:PATH += ";$env:PATH_LATEX"
#}
#
#function Cuda {
#    if($env:IS_CUDAVARS_SET) {
#        return
#    }
#    $env:IS_CUDAVARS_SET = $true
#    Write-Output("CUDA env activated")
#    $env:PATH = "$env:PATH_CUDA;" + $env:PATH
#}
#
#function NVVP {
#    if($env:IS_NVVPVARS_SET) {
#        return
#    }
#    $env:IS_NVVPVARS_SET = $true
#    if ($env:CUDA_ACTIVE -eq 0) {
#        Cuda
#    }
#    Write-Output("NVVP env activated")
#    $env:PATH = "$env:PATH_NVVP;" + $env:PATH
#}
#
#function NvDLISR {
#    if($env:IS_NvDLISRVARS_SET) {
#        return
#    }
#    $env:IS_NvDLISRVARS_SET = $true
#    Write-Output("NvDLISR env activated")
#    $env:PATH += ";$env:PATH_NVDLISR"
#}
#
#function Activate-NSIGHT {
#    if($env:IS_NSightVARS_SET) {
#        return
#    }
#    $env:IS_NSightVARS_SET = $true
#    Write-Output("NSight env activated")
#    $env:PATH += ";$env:PATH_NSIGHT"
#}
#
#function Activate-Zig {
#    if($env:IS_ZIGVARS_SET) {
#        return
#    }
#    $env:IS_ZIGVARS_SET = $true
#    $env:PATH += ";$env:PATH_ZIG"
#    Write-Output("ZIG env activated")
#}
#
#function Activate-QEMU {
#    if($env:IS_QEMUVARS_SET) {
#        return
#    }
#    $env:IS_QEMUVARS_SET = $true
#    $env:PATH += ";$env:PATH_QEMU"
#    Write-Output("QEMU env activated")
#}
#
#function Activate-ODIN {
#    if($env:IS_ODINVARS_SET) {
#        return
#    }
#    $env:IS_ODINVARS_SET = $true
#    $env:PATH += ";$env:PATH_ODIN"
#    Write-Output("ODIN env activated")
#}
#
#function Activate-NASM {
#    if($env:IS_NASMVARS_SET) {
#        return
#    }
#    $env:IS_NASMVARS_SET = $true
#    $env:PATH += ";$env:PATH_NASM"
#    Write-Output("NASM env activated")
#}
#
#function Activate-CLANG {
#    if($env:IS_CLANGVARS_SET) {
#        return
#    }
#    $env:IS_CLANGVARS_SET = $true
#    $env:PATH += ";$env:PATH_CLANG"
#    Write-Output("CLANG env activated")
#}
#
#function Activate-CCLS {
#    if($env:IS_CCLSVARS_SET) {
#        return
#    }
#    $env:IS_CCLSVARS_SET = $true
#    $env:PATH += ";$env:PATH_CCLS"
#    Write-Output("CCLS env activated")
#}
