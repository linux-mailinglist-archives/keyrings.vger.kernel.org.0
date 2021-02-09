Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848ED31511D
	for <lists+keyrings@lfdr.de>; Tue,  9 Feb 2021 15:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhBIOAv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Feb 2021 09:00:51 -0500
Received: from smtp-bc09.mail.infomaniak.ch ([45.157.188.9]:60117 "EHLO
        smtp-bc09.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231886AbhBIN7m (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Feb 2021 08:59:42 -0500
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DZkyM0ZD7zMqQlf;
        Tue,  9 Feb 2021 14:58:51 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DZkyJ230Czlh8TN;
        Tue,  9 Feb 2021 14:58:48 +0100 (CET)
Subject: =?UTF-8?Q?Re=3a_Conflict_with_Micka=c3=abl_Sala=c3=bcn=27s_blacklis?=
 =?UTF-8?Q?t_patches_=5bwas_=5bPATCH_v5_0/4=5d_Add_EFI=5fCERT=5fX509=5fGUID_?=
 =?UTF-8?Q?support_for_dbx/mokx_entries=5d?=
To:     David Howells <dhowells@redhat.com>,
        Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
References: <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com>
 <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
 <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
 <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
 <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com>
 <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
 <525705.1612876446@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <5055b9b4-2808-8816-d50c-e651bd88a7c3@digikod.net>
Date:   Tue, 9 Feb 2021 14:59:14 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <525705.1612876446@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi David,

The only commit causing issues is commit f78e50c8f750 ("certs: Factor
out the blacklist hash creation"). I think my last patch fix the issue,
and I'm testing with the UEFI DBX, but I don't understand why this
change would have an impact. In the meantime you can push Eric's commits
first, I'll adapt my changes.

 Mickaël


On 09/02/2021 14:14, David Howells wrote:
> 
> Hi Eric, Mickaël,
> 
> Do we have a consensus on this?  From what's written here, I don't think I can
> ask Linus to pull the merge of your two branches.  I feel that I probably need
> to push Eric's first as that fixes a CVE if I can't offer a merge.
> 
> David
> 
