Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0117F1C1B74
	for <lists+keyrings@lfdr.de>; Fri,  1 May 2020 19:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgEARRV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 May 2020 13:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729246AbgEARRU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 1 May 2020 13:17:20 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B30C061A0C
        for <keyrings@vger.kernel.org>; Fri,  1 May 2020 10:17:19 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id r7so7739298edo.11
        for <keyrings@vger.kernel.org>; Fri, 01 May 2020 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SM+YCcLVdlX93c+JR4IqLWmV704zrU8VnQZOOdnMjDM=;
        b=Ty9jHg0AnZ/L6u9OqyoL5YV0OY6nNlNVbBcvwAak7yjUILx7pQ39YAvJ2Lh5oulAd1
         7lPXWMZf/nCCHyTLwSf11jAnEXcmzkDeJQHs9SHtbcCKNFjHjCuF2VqhV1jvhaC+JG5U
         GcPvXCF45CT9DW6ejNqW3zRNk9FLujcPZL13ZLb3s8LGJ5WLBYyzSF+V/Gkr4Mc3nKXW
         e+1gEQGpFmyYCtCsp/nSpCgjETYqCiyhw5qem2Oa+q6Mju7TnBzNxV98X9sGyyCayhu6
         7l2Okhzsg6bAqlmwRSuNEMZMMCMAOnuX3U0eWhPz6SB2G9AtnVFQSaCNf7/UH8zXd1NC
         FfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SM+YCcLVdlX93c+JR4IqLWmV704zrU8VnQZOOdnMjDM=;
        b=Vey5eWULVkwiIlY8p1jzCKyWG3crUh3iMBQjOTh4gm+6eJrt2QkbSuCnNPsA/dbK0l
         ZHdkixBz6fMWyeFdZpbQRGk/W0tCxf/fz+PCT6stX4M7IB7wJnRN+2yZrDHf3MZrnAQB
         gpNt2alt3P3SkyPPWcU1gFdab7zF80wZX2C63x4TRUBZlJzdgcRzreKDHGm14uWHFO0N
         B3uF4hARKUucZGqrlBIVHThPCCKAdemOdA8EG9Rt85XiIzA0ZwHdTZOaKEQHAsu6/zvH
         +YfwDvmAvmRompZ6CyuDkifN4vlOLbWR0W1SHkxeo+2r0s4Olv+XeH3d8VMqTaF2IQQp
         aOfw==
X-Gm-Message-State: AGi0PubBkqZHrLhBI1kqmnbzzhEp+7zBSioH178b9d6feK/1t7Ssc0xn
        9OMZ3dWrVWWtlEbKmi8lYQK5C0I6wM5js7MupzmGGktMjL4=
X-Google-Smtp-Source: APiQypKlp2zYzmtH3V/i5tIcaLH6LLkETS3XRo+IfB2jdy5JvDHLXdWF3cDu0o0dqMAj1Q1PpaErPP8QSrLOElCnYx4=
X-Received: by 2002:a50:f61c:: with SMTP id c28mr4208450edn.365.1588353437528;
 Fri, 01 May 2020 10:17:17 -0700 (PDT)
MIME-Version: 1.0
From:   James Prestwood <prestwoj@gmail.com>
Date:   Fri, 1 May 2020 10:17:06 -0700
Message-ID: <CAPv5Ue72DaLDNu5QhHPgxSk3r3mSXN5PZMKXA1LUo88nmKymCQ@mail.gmail.com>
Subject: Re: old "add integrity and security to TPM2 transactions" patches
To:     keyrings@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

I don't have the original email to reply to, but can be found in the archives:

https://lore.kernel.org/linux-crypto/20190910162132.GA11338@linux.intel.com/

I am trying to get these patches working on my hardware TPM. They work
fine with an emulated TPM but not on the TPM I have. I have a Dell XPS
9550, which came stock with a 1.2 TPM. I did a firmware upgrade
provided by Dell to get TPM 2.0.

The kernel TPM initialization/start up works fine, and seems to create
the null primary key successfully. The problem starts when trying to
load the null key context (tpm2_load_context) in
tpm2_start_auth_session(). This command fails to transmit with -EIO. I
can't really get any more info other than this since there is no debug
info to get from a TPM.

I am trying to determine if its the above patches, or my TPM behaving
badly. Is there some preparation I need to do on the TPM to get this
working? I have cleared it a few times to start fresh but nothing
seems to change.

I am not very familiar with the various tss tools to interact with the
TPM, but I was able to create a primary key (tsscreateprimarykey) as
well as get capabilities, so the TPM is at least accepting those, just
not a load context apparently.

Thanks,
James

Thanks,
James
