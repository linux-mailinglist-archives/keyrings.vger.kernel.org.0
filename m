Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17BB7746C0
	for <lists+keyrings@lfdr.de>; Tue,  8 Aug 2023 21:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjHHTBF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Aug 2023 15:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjHHTAq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Aug 2023 15:00:46 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C373EB88
        for <keyrings@vger.kernel.org>; Tue,  8 Aug 2023 10:28:22 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-40a47e8e38dso14701cf.1
        for <keyrings@vger.kernel.org>; Tue, 08 Aug 2023 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515701; x=1692120501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8m2sz5ofN14PKsEKJrI2xSIa/NZXT9WULPoAZ3lB9qU=;
        b=gwOPrQUq58pYRPV743cnNd80mDDQwF8PRJ17Q2kjD8B7u0ywK3ENl4bcekD6U//BXA
         zctTGF//ZGCouRHmR9UPk+KyfsO2gBmmVG9AjqQW+PpabrPpoEmWUDvH+M4gUaRuVeFB
         DLI8sKz5vavKxmJ617OahzfbwmrcPkEqgtqoFmxSvRN13sW0zVOZtnXYbdbXcFWEoZYx
         FKikqU1BjBaqGKe1YWhQuPX9PJZlAQxN+NZNbxKaDzbSSfopIJKMseqRCRt3ySZKIYgt
         vZbXa1hBQPXwsBw3ZCCaMwPnzgGOKJFW49QYnCuEwGfWQN8SODFBvVGZ9382gCTWNnOn
         M5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515701; x=1692120501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8m2sz5ofN14PKsEKJrI2xSIa/NZXT9WULPoAZ3lB9qU=;
        b=S3hlhMrdNB7Gqpj49ebHvX7tL0P5bMI//W02XAumy9lQ8caKigC6ds6SyV/9AQLBhL
         nqGgR3Sk+7COBH5OWEGjvBfWAQ5145IZuS3TDRiE3wu+I7hKI1JGNiQ9VBMqN0L16uZJ
         lWa5MNqB13SkVya/TKE8XLbI0IhCaGTkkBk8SxeJ2vs53IXxpuKB6D5lfmkX/WAqTsYY
         3SQCW/Na5ATTw4GkvzRlGPqLRBNEPjYHBD6Cg0RQ+0QZA8HkhoTwdSVRlnq2PjSgyDeu
         /7n9wFzEqUy/raMnZgCHRdQPC0sW0a1l8Sjkum2a9FJO3iTEQmD0xXEFIBTAUdk3wrX9
         7y/Q==
X-Gm-Message-State: AOJu0Yyb7YPxKv24Bbs3buu05zQLE9R060ppCDygI7UucHroZjFSSthH
        KdVR0x6z+RgadSDs2yR+OqicHUXzQgOJNepY/BU2Vg==
X-Google-Smtp-Source: AGHT+IFageD8Xz1u57GixYSKm20N8XHO6KbVXPJLL1PT98Mt37GF0ywxR1gnVgeRo2hCqp53F3eJr8SMw+iQeUoSS4k=
X-Received: by 2002:ac8:5850:0:b0:403:a43d:bd7d with SMTP id
 h16-20020ac85850000000b00403a43dbd7dmr15772qth.4.1691515274187; Tue, 08 Aug
 2023 10:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch>
 <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
 <2425e00b-defb-c12b-03e5-c3d23b30be01@linux.intel.com> <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
 <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com> <64d270a2a68ce_5ea6e294f0@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64d270a2a68ce_5ea6e294f0@dwillia2-xfh.jf.intel.com.notmuch>
From:   Dionna Amalie Glaze <dionnaglaze@google.com>
Date:   Tue, 8 Aug 2023 10:21:02 -0700
Message-ID: <CAAH4kHYht5s4CkS5Y9+VotPH4WqDrzng0vYy89oq0_U16H_dDA@mail.gmail.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        dhowells@redhat.com, Brijesh Singh <brijesh.singh@amd.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Samuel Ortiz <sameo@rivosinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-coco@lists.linux.dev, keyrings@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

>
> I do not see sysfs precluding a use case like that. If the kernel can
> call out to userspace for TLS connection setup [1], then advanced user
> can call out to a daemon for workload provenance setup. Recall that TDX
> will round trip through the quoting enclave for these reports and,
> without measuring, that seems to have the potential to dominate the
> setup time vs the communication to ask a daemon to convey a report.
>

It's rather hard to get new daemons approved for container
distributions since they end up as resource hogs.
I really don't think it's appropriate to delegate to a daemon to
single-thread use of a kernel interface when the interface could
provide functional semantics to begin with.

> [1]: https://lore.kernel.org/all/168174169259.9520.1911007910797225963.stgit@91.116.238.104.host.secureserver.net/



-- 
-Dionna Glaze, PhD (she/her)
