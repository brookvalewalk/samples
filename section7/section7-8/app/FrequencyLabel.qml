/**
 * Copyright (c) 2018 Nobumasa Murakami
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
import QtQuick 2.7

Flickable {
    id: flc_scale
    property int rate
    property real marker: 0
    interactive: false
    signal pressAndHold()

    Rectangle {
        id: rct_scale
        color: "black"
        width: flc_scale.contentWidth
        height: flc_scale.contentHeight
        property real rangeHigh: rate === 8000 ? 4000 :
                                 rate === 16000 ? 8000 : 1
        property real rangeLow: 0

        MouseArea {
            anchors.fill: parent
            onPressAndHold: flc_scale.pressAndHold()
        }

        Repeater {
            model: (rct_scale.rangeHigh / 100) + 1
            AxisLabel {
                x: (index * 100) * rct_scale.width / (rct_scale.rangeHigh - rct_scale.rangeLow)
                height: rct_scale.height
                text: (index * 100) + "Hz"
                visible: index % 5 === 0 ? true :
                         rct_scale.width / (rct_scale.rangeHigh - rct_scale.rangeLow) > 1

            }
        }
    }
}
