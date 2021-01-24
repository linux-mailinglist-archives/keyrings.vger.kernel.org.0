Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532F2301CA2
	for <lists+keyrings@lfdr.de>; Sun, 24 Jan 2021 15:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbhAXOQN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 24 Jan 2021 09:16:13 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:16373 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbhAXOQN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 24 Jan 2021 09:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611497591;
        s=strato-dkim-0002; d=chronox.de;
        h=Message-ID:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=EfwRCaVmOmu2bkiazi/BUFb6HBO1WhdP4qskcsCIDWs=;
        b=jEaGxxc1GZsb+vpbjjZyRyJAMkQeRxILQBeS3jCC4a2WH4U2kMwnzhq8kiMwFgfvL7
        wmI3I7AReXqdGVf/r0vhwRJ3jYzg5DS/Kps+wWVLn/wlzJOQeVPaM7IaZ0CKq/uLZGBs
        fn0nNVXXB2fSaOPhESBCo5zg+EH/6aA1ABGWuDvMMQ9hYrZm6w3/8mo8HeSugbI2bPNo
        zNwDjPXVkp7Vsd4hByY4ApuMFRNVH1z26+l1B1zi4FhHyV1oVXDjPHlciqi6hmKdmxe5
        LEW0xE0F9ry18I8C1n0LkwjhCdVNCmhzLg56drseNenP6lK6i3jgxt003eObW+vhsGes
        S0bQ==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPZI/ScIzb9"
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id Z04c46x0OEDBejW
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 24 Jan 2021 15:13:11 +0100 (CET)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org
Subject: Keyctl: DH test failure
Date:   Sun, 24 Jan 2021 15:13:10 +0100
Message-ID: <7903360.NyiUUSuA9g@positron.chronox.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

The keyctl test COMPUTE DERIVED KEY WITH LEADING ZEROS fails on current 
kernels.

keyutils/tests/keyctl/dh_compute/valid

+++ LOAD SOURCE KEYS
+++ COMPUTE DH PUBLIC KEY
+++ LOAD SHA-256 SOURCE KEYS
+++ COMPUTE DH SHARED SECRET
+++ COMPUTE DERIVED KEY FROM DH SHARED SECRET (SHA-256)
+++ COMPUTE DERIVED KEY WITH LEADING ZEROS
FAILED
+++ LOAD SHA-224 SOURCE KEYS
+++ COMPUTE DH SHARED SECRET
+++ COMPUTE DERIVED KEY FROM DH SHARED SECRET (SHA-224)


The failure happens in the following check:

+ '[' 2 '!=' 2 -o 'xf571d0e7 18e00aba c6c1962b 11ded645' '!=' 'x0066207b 
cdab1d64 bbf489b3 d6a0dadc' ']'

I.e. the kernel returns "xf571d0e7 18e00aba c6c1962b 11ded645" but the test 
expects "x0066207b cdab1d64 bbf489b3 d6a0dadc".

Ciao
Stephan


