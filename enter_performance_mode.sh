echo 'gpu使用率: '
adb shell cat /sys/class/kgsl/kgsl-3d0/gpubusy

echo '\ngpu频率:'
adb shell cat /sys/class/kgsl/kgsl-3d0/gpuclk
adb shell cat /sys/class/kgsl/kgsl-3d0/devfreq/cur_freq

echo '\ngpu可用频率:'
adb shell cat /sys/class/kgsl/kgsl-3d0/gpu_available_frequencies
#adb shell cat /sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies

echo '\ngpu可用工作模式:'
adb shell cat /sys/class/kgsl/kgsl-3d0/devfreq/available_governors

echo 'gpu当前工作模式:'
adb shell cat /sys/class/kgsl/kgsl-3d0/devfreq/governor

echo 'cpu 可用工作模式'
adb shell cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors

adb root

for (( i = 0; i < 8; i++ )); do
    adb shell "echo \"performance\" > /sys/devices/system/cpu/cpu${i}/cpufreq/scaling_governor"
    echo "cpu${i} 当前工作模式: "
    adb shell "cat /sys/devices/system/cpu/cpu${i}/cpufreq/scaling_governor"

    echo "cpu${i} 当前核心工作频率: "
    adb shell cat "/sys/devices/system/cpu/cpu${i}/cpufreq/scaling_cur_freq"
done


#adb shell cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
#cpu0/cpufreq/scaling_governor