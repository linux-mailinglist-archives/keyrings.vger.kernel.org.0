Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD38330E2CD
	for <lists+keyrings@lfdr.de>; Wed,  3 Feb 2021 19:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhBCSuY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Feb 2021 13:50:24 -0500
Received: from smtp-bc08.mail.infomaniak.ch ([45.157.188.8]:48837 "EHLO
        smtp-bc08.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231388AbhBCSuU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Feb 2021 13:50:20 -0500
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DW9hX688NzMpssv;
        Wed,  3 Feb 2021 19:49:32 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DW9hV18r8zlh8TC;
        Wed,  3 Feb 2021 19:49:30 +0100 (CET)
Subject: =?UTF-8?Q?Re=3a_Conflict_with_Micka=c3=abl_Sala=c3=bcn=27s_blacklis?=
 =?UTF-8?Q?t_patches_=5bwas_=5bPATCH_v5_0/4=5d_Add_EFI=5fCERT=5fX509=5fGUID_?=
 =?UTF-8?Q?support_for_dbx/mokx_entries=5d?=
To:     David Howells <dhowells@redhat.com>,
        Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
Date:   Wed, 3 Feb 2021 19:49:31 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <1103491.1612369600@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This looks good to me, and it still works for my use case. Eric's
patchset only looks for asymmetric keys in the blacklist keyring, so
even if we use the same keyring we don't look for the same key types. My
patchset only allows blacklist keys (i.e. hashes, not asymmetric keys)
to be added by user space (if authenticated), but because Eric's
asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it should
be OK for his use case.  There should be no interference between the two
new features, but I find it a bit confusing to have such distinct use of
keys from the same keyring depending on their type.

Regards,
 Mickaël


On 03/02/2021 17:26, David Howells wrote:
> 
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
> 
>> This is the fifth patch series for adding support for 
>> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only include
>> dbx entries but also entries in the mokx.  Additionally my series to
>> preload these certificate [2] has also been included.
> 
> Okay, I've tentatively applied this to my keys-next branch.  However, it
> conflicts minorly with Mickaël Salaün's patches that I've previously merged on
> the same branch.  Can you have a look at the merge commit
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=keys-next&id=fdbbe7ceeb95090d09c33ce0497e0394c82aa33d
> 
> 	(the top patch of my keys-next branch)
> 
> to see if that is okay by both of you?  If so, can you give it a whirl?
> 
> Thanks,
> David
> 
