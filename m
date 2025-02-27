Return-Path: <keyrings+bounces-2412-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A160BA47ABA
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2025 11:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640641890C65
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2025 10:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA8A22AE7B;
	Thu, 27 Feb 2025 10:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EfBCFwJP"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A008229B3D
	for <keyrings@vger.kernel.org>; Thu, 27 Feb 2025 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740653267; cv=none; b=BZr8ixO+XHFLcbvf2/rLUhfdDDmVly7faPKAuESYyiws0D+onLg2VtOX2/EZDwkKFdf8ajub2Vz9IWJwVZYgWq8JMoz1vvqlT3/zvB4QhrgpBmQXpcxzpW6CB+Nw42El8hgMloBfQml+EJQ6kTkP+MJXOfa5FqW+P4bpM9p40Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740653267; c=relaxed/simple;
	bh=voqDI+sR3cgQLpRJNz2L7lClXa4i8MTgaVBRLvybSdM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:
	 References:In-Reply-To; b=VWY/yoeFubmmrNguzEpRJLxrkdXiSRwCNVjt0uf7ftpkCdrNbc4iDJ26cTWEglUo07V/QlFpCqn+wD55DQ0uNFakJ18nkENp2Rw964BUkb7dNMp3u4h50vFcwEoIIB0tbwYU4uuTEpkV018mzAQS2NAOI1YNI8/ZVMe1Lql0vAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EfBCFwJP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so141587766b.3
        for <keyrings@vger.kernel.org>; Thu, 27 Feb 2025 02:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740653264; x=1741258064; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwYrgbQrysBcAd8WRw0jB/UCnkIW4vR+8ZOYC92wVf4=;
        b=EfBCFwJPvX3mJBaI1iMIG6qRcCc/ZE0MBX6+7rU2JyA55KjwnWRARWDOtWMpATTJti
         9qUmo44uX1c6pWtCIbFfYfLsskm0Z+OJJTDPwaPVPGrCOUs4Ug+GbrP5n5QpXGkoXfmc
         f0tJxpdBmvPQ2TSmKxKhrrIIb5LOWDH6aVbCK7qzHu8fTNodSJbHz+U6mBIGWyOsE0FO
         l216f4svoJhdStviEPpjKgQJbsScHiJXTljrahFMHQ/CJvEbnyDPcsXn9aLsiV4tatLT
         MtBnRnVkSvqtwK8VLafHNFU5s4Wo3lJnyw66a/1hXQWEtc//lnIdWMBp5un8H2t58QMJ
         2ZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740653264; x=1741258064;
        h=in-reply-to:references:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hwYrgbQrysBcAd8WRw0jB/UCnkIW4vR+8ZOYC92wVf4=;
        b=xJZOjPllWP/qf9JWLU1aRa0GCaZuzF1Nf8+05y9Q7gUMyHwRSOxQ+CvUdA0u+8mAsB
         pKt9n9c17cGOQUcvxqi9w2UCpRSiuSaNW2jbC1Wff0vMd0SbiJpEKVPi59s5JuXvSNYW
         A8e0F9Jiv9fw8sim8uHzSDEISZ83U/h6WlvTRoCPUL7u56OU6okI69NSzRwWfo1y+Khe
         K1mCVlR2UlN2W2vW0yyW6lJPYo16gP5kIWT40EG6tTPcsyBI6VZaKmyAeJmSpxkupNy6
         SYBLCy4NZlF9YDGrI7xQlPi1DIK46bmTNG5lXutJ0n54CXeTyLyhdIfKnrvgqAeZ9hHC
         0aOw==
X-Forwarded-Encrypted: i=1; AJvYcCWZBrYEa6DIMXL5rZCb6NhvoNTIqylb8/2XlMnTSDc2R289285gikiyDwYxLEatdU3+vBLh6qEYGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTv0ABTdymkWHeVp2UkU8fDH9WBsyi9ooRp8EdJoPavBdcxI42
	LvhKQFkxjLcN+B3+FqYqLHTXDNg/3VkzRqZBoPb1S1AHTZIeSXreVgghSnXlp0s=
X-Gm-Gg: ASbGncsEW13ZtHOWD/SiQSk8UPN1beEYBT/MGAAfGLqo92gdQ4hZ8+WQckFl85wO9uM
	7BdqnBdNqk2TD5Bf4JZIk+QnfyYo5GiaZdWfphG7F7s3KNslu2whNqsZTOC1f+KbP+3dwVlf7xD
	AV3Ts54FDbmUq8qDBlFM4rq00StCylILk9GB4ZwCXPDvvi6pnowH4WU2r6F+QYGT0EoIqF6TTeb
	Vil3iEKUsUywokLRtuiHfg16E2CtpSFDe+Z1B3s+/YuAw9cP+TCPGG058iQLiyXpgAzx/wQc3J/
	9bPpLqCHhXqiX5Y=
X-Google-Smtp-Source: AGHT+IH/QdSWLijhlmKS6cpPQOvDmaBBqLi3TtTAJFjDo0/KOlaCmiQJXCXK3w63xzxEUvqFh2dyGw==
X-Received: by 2002:a17:907:770f:b0:abe:e91e:b7d9 with SMTP id a640c23a62f3a-abeeed10d3bmr882696466b.1.1740653262374;
        Thu, 27 Feb 2025 02:47:42 -0800 (PST)
Received: from localhost ([179.228.215.131])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-734a00400absm1199194b3a.151.2025.02.27.02.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:47:41 -0800 (PST)
From: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 07:47:38 -0300
Message-Id: <D8362ZV7Y4YI.PJTF4OC88RQK@suse.com>
Subject: Re: [PATCH] security: keys: Make sysctl table const
Cc: "James Morris" <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>, <keyrings@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Paul Moore" <paul@paul-moore.com>, "Ricardo B. Marliere"
 <ricardo@marliere.net>, "David Howells" <dhowells@redhat.com>, "Jarkko
 Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250123-sysctl_const-pcmoore-v1-1-d9f918dbb0be@suse.com>
 <CAHC9VhQpkyqaJsxj9_d4d6Vpc+FVbSnH_HeAFAVEdj0trGCh1g@mail.gmail.com>
In-Reply-To: <CAHC9VhQpkyqaJsxj9_d4d6Vpc+FVbSnH_HeAFAVEdj0trGCh1g@mail.gmail.com>

Hi Paul,

On Wed Feb 26, 2025 at 9:21 PM -03, Paul Moore wrote:
> On Thu, Jan 23, 2025 at 2:50=E2=80=AFPM Ricardo B. Marliere
> <ricardo@marliere.net> wrote:
>>
>> Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
>> ctl_table"), the sysctl registration API allows for struct ctl_table to =
be
>> in read-only memory. Move key_sysctls to be declared at build time, inst=
ead
>> of having to be dynamically allocated at boot time.
>>
>> Cc: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>> Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
>> ---
>>  security/keys/sysctl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Looks fine to me.  David or Jarkko, this looks like something for the
> keys tree, yes?
>
> Reviewed-by: Paul Moore <paul@paul-moore.com>

Thank you for the review, but I believe this has been done here:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D1751f872cc97f992ed5c4c72c55588db1f0021e1

>
>> diff --git a/security/keys/sysctl.c b/security/keys/sysctl.c
>> index 91f000eef3ad82370250e5238d9c9c80757aab61..cde08c478f3272081304e6db=
34e36b64ce0d321a 100644
>> --- a/security/keys/sysctl.c
>> +++ b/security/keys/sysctl.c
>> @@ -9,7 +9,7 @@
>>  #include <linux/sysctl.h>
>>  #include "internal.h"
>>
>> -static struct ctl_table key_sysctls[] =3D {
>> +static const struct ctl_table key_sysctls[] =3D {
>>         {
>>                 .procname =3D "maxkeys",
>>                 .data =3D &key_quota_maxkeys,
>>
>> ---
>> base-commit: 714d87c90a766e6917f7d69f618b864d350f09d3
>> change-id: 20250123-sysctl_const-pcmoore-fa14389b8329
>>
>> Best regards,
>> --
>> Ricardo B. Marliere <rbm@suse.com>


