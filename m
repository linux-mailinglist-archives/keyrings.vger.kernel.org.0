Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701874F0463
	for <lists+keyrings@lfdr.de>; Sat,  2 Apr 2022 17:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351759AbiDBPZ4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 2 Apr 2022 11:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiDBPZz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 2 Apr 2022 11:25:55 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CCC33375
        for <keyrings@vger.kernel.org>; Sat,  2 Apr 2022 08:24:02 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id u9so1064210edd.11
        for <keyrings@vger.kernel.org>; Sat, 02 Apr 2022 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=pR6BQtJb61in8LI2RFfYMWRuA6qssaKJHiA8Szyk98E=;
        b=dZ6B0rmBbn6QRB2CGYnKiqt+A9OfjP0b9Jb+mdx5Mab9Pr83Xz22KmJlJg5iGhjeSJ
         FPAmXXt7CqZ7Em9Azz3XvAHCuLPogY98MjzgGQosw8tedERX4o2r/q86H0MpYGCu2LTz
         dBAKpzc404DUv66B57/Gj7sL8T25YCTSr6+aTvfytSgvSXYAlJticmMXCmICrWQE2W5q
         YvdZiQfvaqPre0TPUbZXMgxcXrJyEt6blc35OU1IH4k0ymKi2BmzECb9sTYnbeAxPuTG
         9wnLW+SYrRDLcqdP+oxwcFHqOKSQV1LWVLU55Z67H5kf1Cve/6zCw+c4A52w80Dmn0LH
         ussA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=pR6BQtJb61in8LI2RFfYMWRuA6qssaKJHiA8Szyk98E=;
        b=FSmuO5uikH2S/ZAaS8N+VtjXTiw4U9FY9hmHXnWbJNaGv0EvVrEEeklBynvZBrdJ97
         AinmCrCYFA9kv2aLjdb+O8KXdyuR13k3DflutYck9lA6rJs2ndES/DvikJr6bnX/pyVA
         xzfM8+z94/LNcAIZ5/PclRG72HwA0Offe8JJOxqtLYqxhVoLHusLGt2Ouc3WTmDJ+iJE
         xi7b5VHFEWYgssJZCF6BwxXJPlJURQjcTK6bjnX7aTUsJZSlYNnkqS+KrBNex4vZZReM
         Qyjq2dg2fbtvXibCOvns8Ym4UpmTmCd20pz2sVkA6Cgf3WQedHw/n50AjmhkuNLDQ8bx
         Jm9Q==
X-Gm-Message-State: AOAM5307LHw4ew+gZijdxUuP9rrCN+bjXJBCF9ZhwfmOmtgco7lTPghX
        F4zvnVdtpyevLK8E5iVIJiSWjb9eq2+9vs0ma+M=
X-Google-Smtp-Source: ABdhPJzfpO9x/irXYPkJ+ByoIvEYWhB4lC8ADz0LH3KvLOarjg5u+B3PSgy9KA+2ojraLBe96jZg8Byr6KLOqqlpQQU=
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id
 f11-20020a0564021e8b00b0041c59f62c26mr8136977edf.156.1648913040944; Sat, 02
 Apr 2022 08:24:00 -0700 (PDT)
MIME-Version: 1.0
From:   Duke Abbaddon <duke.abbaddon@gmail.com>
Date:   Sat, 2 Apr 2022 16:24:03 +0100
Message-ID: <CAHpNFcM_1BnAzzSYbpQ1gX8H3u+FY_nLag3OY8+3CJ44N7tU8Q@mail.gmail.com>
Subject: submit it for inclusion in the standard along with Vector Compression
 VESA Standard Display protocol 3
To:     torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

is QFT a Zero compression or low level compression version of DSC
1.2b? Maybe X-OR X=3D1 New Data & X=3D0 being not sent ? Therefore Masking
The Frame Buffer!

If not i dually submit it for inclusion in the standard along with
Vector Compression VESA Standard Display protocol 3
https://lkml.org/lkml/2022/4/2/295

"QFT transports each frame at a higher rate to decrease =E2=80=9Cdisplay
latency=E2=80=9D, which is the amount of time between a frame being ready f=
or
transport in the GPU and that frame being completely displayed. This
latency is the sum of the transport time through the source=E2=80=99s outpu=
t
circuits, the transport time across the interface, the processing of
the video data in the display, and the painting of the screen with the
new data. This overall latency affects the responsiveness of games:
how long it appears between a button is pressed to the time at which
the resultant action is observed on the screen.

While there are a lot of variables in this equation, not many are
adjustable from an HDMI specification perspective. QFT operates on the
transport portion of this equation by reducing the time it takes to
send only the active video across the cable. This results in reduced
display latency and increased responsiveness."

*****

VecSR - Vector Standard Render

VESA Standards : Vector Graphics, Boxes, Ellipses, Curves & Fonts :
Consolas & other brilliant fonts : (c)RS

SiMD Render - Vector Graphics, Boxes, Ellipses, Curves & Fonts

OT-SVG Fonts & TT-SVG Obviously Rendered in Direct X 9+ & OpenGL 3+
Mode & Desktop Rendering modes

Improve Console & TV & BIOS & General Animated Render

Vector Display Standards with low relative CPU Weight
SiMD Polygon Font Method Render

Default option point scaling (the space) : Metadata Vector Fonts with
Curl mathematical vector :

16 Bit : SiMD 1 width
32 Bit : SiMD Double Width

High precision for AVX 32Bit to 256Bit width precision.

Vectoring with SiMD allows traditional CPU mastered VESA Emulation
desktops & safe mode to be super fast & displays to conform to VESA
render standards with little effort & a 1MB Table ROM.

Though the VESA & HDMI & DisplayPort standards Facilitates direct low
bandwidth transport of and transformation of 3D & 2D graphics & fonts
into directly Rendered Super High Fidelity SiMD & AVX Rendering Vector

Display Standards Vector Render : DSVR-SiMD Can and will be directly
rendered to a Surface for visual element : SfVE-Vec

As such transport of Vectors & transformation onto display (Monitor,
3D Unit, Render, TV, & Though HDMI, PCI Port & DP & RAM)

Directly resolve The total graphics pipeline into high quality output
or input & allow communication of almost infinite Floating point
values for all rendered 3D & 2D Elements on a given surface (RAM
Render Page or Surface)

In high precision that is almost unbeatable & yet consumes many levels
less RAM & Transport Protocol bandwidth,

Further more can also render Vector 3D & 2D Audio & other elements
though Vector 'Fonting' Systems, Examples exist : 3D Wave Tables,
Harmonic reproduction units for example Yamaha and Casio keyboards.

(c)Rupert S

https://science.n-helix.com/2016/04/3d-desktop-virtualization.html

https://science.n-helix.com/2019/06/vulkan-stack.html

https://science.n-helix.com/2019/06/kernel.html

https://science.n-helix.com/2022/03/fsr-focal-length.html

https://science.n-helix.com/2018/01/integer-floats-with-remainder-theory.ht=
ml

https://bit.ly/VESA_BT

*

*Application of SiMD Polygon Font Method Render
*3D Render method with Console input DEMO : RS

3D Display access to correct display of fonts at angles in games &
apps without Utilizing 3rd Axis maths on a simple Shape polygon Vector
font or shape. (c)Rupert S

3rd dimensional access with vector fonts by a simple method:

Render text to virtual screen layer AKA a fully rendered monochrome, 2
colour or multi colour..

Bitmap/Texture,

Due to latency we have 3 frames ahead to render to bitmap DPT 3 / Dot 5

Can be higher resolution & we can sub sample with closer view priority...

We then rotate the texture on our output polygon & factor size differential=
.

The maths is simple enough to implement in games on an SSE configured
Celeron D (depending on resolution and Bilinear filter & resize

Why ? Because rotating a polygon is harder than subtracting or adding
width, Hight & direction to fully complex polygon Fonts & Polygon
lines or curves...

The maths is simple enough to implement in games on an SSE configured
Celeron D (depending on resolution and Bilinear filter & resize.

*

VecSR is really good for secondary loading of sprites & text; In these
terms very good for pre loading on for example the X86, RISC, AMIGA &
Famicon type devices,
With appropriate loading into Sprite buffers or Emulated Secondaries
(Special Animations) or Font Buffers.

Although Large TT-SVG & OT-SVG fonts load well in 8MB Ram on the Amiga
with Integer & Emulated Float (Library); Traditional BitMap fonts work
well in a Set Size & can resize well if cached!

The full process leads upto the terminal & how to optimise CON,
We can & will need to exceed capacities of any system & To improve them!

presenting: Dev-Con-VectorE=C2=B2
Fast/dev/CON 3DText & Audio Almost any CPU & GPU ''SiMD & Float/int"
Class VESA Console +

With Console in VecSR you can 3DText & Audio,

VecSR Firmware update 2022 For immediate implementation in all
operating systems & ROM's

Potential is fast & useful.

*

https://science.n-helix.com/2022/04/vecsr.html
