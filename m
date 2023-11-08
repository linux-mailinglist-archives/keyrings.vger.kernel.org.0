Return-Path: <keyrings+bounces-71-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4077E4F63
	for <lists+keyrings@lfdr.de>; Wed,  8 Nov 2023 04:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1E71C2097F
	for <lists+keyrings@lfdr.de>; Wed,  8 Nov 2023 03:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26EE1375;
	Wed,  8 Nov 2023 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CjlSIiQQ"
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CE1368
	for <keyrings@vger.kernel.org>; Wed,  8 Nov 2023 03:14:35 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C5510EF
	for <keyrings@vger.kernel.org>; Tue,  7 Nov 2023 19:14:34 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so6659682276.0
        for <keyrings@vger.kernel.org>; Tue, 07 Nov 2023 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1699413274; x=1700018074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5vx1SuH10I5MRrYLP20KitGIgEW4Afe0xq877n9y14=;
        b=CjlSIiQQuOE3VfMJb6D4Vo36nueAem9Rbb01GWWcXrlRqwHLcWpjjXuMeIbOWPRyhG
         H2/yuzBQxt6xla58bQUxpW9dJiUUuQH1uZh2jB/Nw9DwilvMqzko5Pbln09PRGVUcHzJ
         cC1I/zqOwxC+W4DCYVT+w9iGSXbRbzmVMHKFEm0TDZURchgkWVE7KuJPSR5eIOoDNxe2
         DRzYmfmlG7zup3vE+oQk/4h096IC5Cqox/VAgKgQwp9lpMLAFrN3IPphaVDMW+1AZY5p
         PpHtdmgJhyGihHUA8LYlHK8duyBPk4GEwKzA875M6hxBEKhqdSkv+qLwNJ8vQJP3R4dq
         d/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699413274; x=1700018074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5vx1SuH10I5MRrYLP20KitGIgEW4Afe0xq877n9y14=;
        b=irkjvEgpBoa2OGOzzSkmd8oF4c5wrWWNosrAIY5i5OZ6bmxOv7NUApd16td9XJX1m0
         S2eDKdrn1fLayaU3bC3SpXWhSTdwuF5QMeD7yUYumci1SJFfkbCTMf76RjKiUsYMm8jH
         KCxoAU7UB6ewp4DxZu9KV+9IU03BsAeYQ2xsxQdd3mHF5XXlp2XSjLDxBoTm3+RP4E7v
         IazH1iCXyBXfn8EbFGtRUgbCYH9jU0PsR1tiX/yGJdGCS1ZHxf32ngr5rOOHAmkxDnNv
         2Imj71vudoqPim+tf1qAWUCsrClG7HoO+I7AnoUgajGggLHJzWq7v7VtHqWfEEhP5TS8
         OoBA==
X-Gm-Message-State: AOJu0YzAs/a2VeeYFCRUXcMJ41VOATa3OliL+9XqG/fhzzFdzC7o0qtf
	bFAOxVw+OpudrAAAy8375uhNQcnX9AjoazUppiqJ
X-Google-Smtp-Source: AGHT+IHRgz90UgPoCYkWlS/aMw9sFfxqMSEFQczpq2CHZMN0KkBg+tCoSKeeUm0SHGN1yPZnqOEZ5u4F1SzXp1qhhSI=
X-Received: by 2002:a25:c00f:0:b0:da0:400e:750c with SMTP id
 c15-20020a25c00f000000b00da0400e750cmr643211ybf.27.1699413274027; Tue, 07 Nov
 2023 19:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107134012.682009-1-roberto.sassu@huaweicloud.com> <563820b8fd57deb99e6247b6cdb416c4c3af3091.camel@huaweicloud.com>
In-Reply-To: <563820b8fd57deb99e6247b6cdb416c4c3af3091.camel@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Nov 2023 22:14:23 -0500
Message-ID: <CAHC9VhQ8otggx3uvwsdK=d6CJ167DHRuqPqihibJ37uCQ=_HbA@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] security: Move IMA and EVM to the LSM infrastructure
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, chuck.lever@oracle.com, 
	jlayton@kernel.org, neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, 
	tom@talpey.com, jmorris@namei.org, serge@hallyn.com, zohar@linux.ibm.com, 
	dmitry.kasatkin@gmail.com, dhowells@redhat.com, jarkko@kernel.org, 
	stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, 
	mic@digikod.net, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	selinux@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 9:06=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> Hi everyone
>
> I kindly ask your support to add the missing reviewed-by/acked-by. I
> summarize what is missing below:
>
> - @Mimi: patches 1, 2, 4, 5, 6, 19, 21, 22, 23 (IMA/EVM-specific
>          patches)
> - @Al/@Christian: patches 10-17 (VFS-specific patches)
> - @Paul: patches 10-23 (VFS-specific patches/new LSM hooks/new LSMs)

This patchset is next in my review queue :)

> - @David Howells/@Jarkko: patch 18 (new LSM hook in the key subsystem)
> - @Chuck Lever: patch 12 (new LSM hook in nfsd/vfs.c)
>
> Paul, as I mentioned I currently based the patch set on lsm/dev-
> staging, which include the following dependencies:
>
> 8f79e425c140 lsm: don't yet account for IMA in LSM_CONFIG_COUNT calculati=
on
> 3c91a124f23d lsm: drop LSM_ID_IMA
>
> I know you wanted to wait until at least rc1 to make lsm/dev. I will
> help for rebasing my patch set, if needed.

No, it should be fine for right now.  Thanks for your patience and
help with all of this.

--=20
paul-moore.com

