pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire

Singleton {
    id: root
    property string format: "ddd, MMM dd - HH:mm"
    property int cpuUsage: 0
    property int memUsage: 0

    property string dateTime: Qt.formatDateTime(new Date(), Theming.barClockFormat)

    //battery vars
    readonly property var battery: UPower.displayDevice
    property real percentage: battery?.percentage ?? 0
    property int batteryLevel: Math.round(percentage * 100)
    property bool isCharging: (battery?.state === UPowerDevice.Charging)
                           || (battery?.state === UPowerDevice.FullyCharged 
                               && percentage != 100)   
    property bool isFullyCharged: (battery?.state === UPowerDevice.FullyCharged)
                                    && (percentage == 100)
    property bool isLow: batteryLevel <= 25 && !isCharging
    property bool isCritical: batteryLevel <= 15 && !isCharging

    //this shit idk man
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    //pipewire bullshit (broken)
    //property PwNode sink: Pipeware.defaultAudioSink
    //property PwNode source: Pipewire.defaultAudioSource
    //property bool sinkReady: sink !== null && sink.audio !== null
    //property bool sourceReady: source !== null && source.audio !== null
    //property real volume: { 
        //if (!sinkReady) return 0
        //const vol = sink.audio.volume
        //if (vol === undefined || vol === null || isNaN(vol)) return 0
        //return Math.max(0, Math.min(1.5, vol))
    //}
    //property int volPerc: Math.round(volume * 100)
    //property bool volMuted: sinkReady ? (sink.audio.muted ?? false) : false

    //volume stuff (replaces broken pipewire) (also has process and timer)
    property int volPerc: 0
    property bool volMuted: false

    //brightness stuff
    property int brightNum: 0
    property int brightMax: 496 //set to max brightness of intel_backlight
    property int brightPerc: Math.round((brightNum / brightMax) * 100)

    //wifi network stuff
    property bool wifiEnabled: false
    property string wifiNet: " "
    //property int wifiStrength: 0     to be implemented

    //bluetooth stuff
    property bool blueEnabled: false
    property string blueName: " "

    //bluetooth enabled process
    Process{
        id: blueStatusProc
        running: true
        command: ["systemctl", "is-active", "bluetooth"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.blueEnabled = text.trim() === "active"
            }
        }    
    }    

    //bluetooth name process
    //lowkey dont know how this is gonna work with multiple devices
    //oh well
    Process {
        id: blueDevProc
        running: true
        command: ["bluetoothctl", "devices", "Paired"]
        stdout: StdioCollector {
            onStreamFinished: {
                var p = text.trim().split(" ")
                root.blueName = p[2]
            }    
        }    
    }

    //wifi enabled process
    Process {
        id: wifiStatusProc
        running: true
        command: ["nmcli", "radio", "wifi"]
        environment: ({
            LANG: "C.UTF-8",
            LC_ALL: "C.UTF-8"
        })
        stdout: StdioCollector {
            onStreamFinished: {
                root.wifiEnabled = text.trim() === "enabled"
            }
        }
    }

    //wifi name process
    Process {
        id: wifiNetProc
        running: true
        command: ["nmcli", "-t", "-f", "NAME", "c", "show", "--active"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.wifiNet = text.trim()
            }
        }
    }

    //brightness process
    Process {
        id: brightProc
        command: ["brightnessctl", "-d", "intel_backlight", "get"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.brightNum = text.trim()
            }
        }
    }

    //volume process
    Process {
        id: volProc
        command: ["pamixer", "--get-volume"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.volPerc = text.trim()
            }
        }
    }    

    //volume mute process
    Process {
        id: muteProc
        command: ["pamixer", "--get-mute"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.volMuted = text.trim() === "true"
            }
        }
    }

    //cpu process
    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCpuTotal > 0) {
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
                }
                lastCpuTotal = total
                lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    //memory process
    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
            if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                memUsage = Math.round(100 * used / total)
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
            memProc.running = true
            wifiStatusProc.running = true
            wifiNetProc.running = true
            blueStatusProc.running = true
            blueDevProc.running = true

        }
    }

    //volume and brightness specific timer
    Timer {
        interval: 200
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            muteProc.running = true
            volProc.running = true
            brightProc.running = true
        }
    }
}
