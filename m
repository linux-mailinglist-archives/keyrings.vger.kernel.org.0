Return-Path: <keyrings+bounces-2805-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B2AD11E3
	for <lists+keyrings@lfdr.de>; Sun,  8 Jun 2025 13:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65527169C76
	for <lists+keyrings@lfdr.de>; Sun,  8 Jun 2025 11:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F2E21146B;
	Sun,  8 Jun 2025 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvFAxypS"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12020A5F1
	for <keyrings@vger.kernel.org>; Sun,  8 Jun 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749381343; cv=none; b=ebBBR64AQ1RMigm/27rTfzgGbz71sAoiGuyw72kyb7vDjcP6gwv0Ta5MqKUFxRh4LVJXv1skyy5JFoMiGillaESw/Lr1NP8EfVGDyHwY6a6WWC+17qeJgGavM7IQdFvHNGAJa6ZyGz8E+59o/+g5Rz6FYvPbcYpTo8cnkjR8nd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749381343; c=relaxed/simple;
	bh=s44Ig4kD0uOE75vgxSLhr3DyJEpmo23BSCxo3Cwy50U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeGclKbpR84AuY1mgsOxoAJQZl0N2jvXYHWajf0GEpPtUM6zsZTPjLvad+sUT6/T6uEqC3IdwkNEFpTDv8jzevt55nqdbbBm2xg+9Y3dlkA4uGRtwv6lb9gwFSmfNCyEEGc7GsxrL0TeyR8H8Qz1nTgyhgXExWOEaJb/1FpHeTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvFAxypS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749381340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGxQhYTVWXecvAAHBQvF+aNN/9v/2PuaedzbvW3oVXc=;
	b=dvFAxypSFtAxckGN2Js1d4c03um4178fhBbc+jX0mLNCSjdDB46U6k8777cVasmnO2w88x
	+zoljbeJXxPDP76EMJRB4yepxB0TBEbYbWuGPL3zkicxw7awQG01ilZiJfLlEUWwtpZj2C
	Ie4XXUngTDrlirUlQshICo3LVi07NDI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-Z5yMUJWcOZqgyBiXbxhP7g-1; Sun, 08 Jun 2025 07:15:38 -0400
X-MC-Unique: Z5yMUJWcOZqgyBiXbxhP7g-1
X-Mimecast-MFC-AGG-ID: Z5yMUJWcOZqgyBiXbxhP7g_1749381337
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so2580068a91.0
        for <keyrings@vger.kernel.org>; Sun, 08 Jun 2025 04:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749381337; x=1749986137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGxQhYTVWXecvAAHBQvF+aNN/9v/2PuaedzbvW3oVXc=;
        b=bjlPmubzwn7QUtI7jxPja8AvtYZNn1eduaTy48YLOa1STjmLo7gCRmG3zYnJbF/S4B
         mDrK1DttAd7oGDXXy0+f3nCPfCkOUu4/F2M0gyfdFtXk2Vi5E7COKbTx8BUFRtpPeDfn
         PPJw69lprWdu2KbKbOgBD58VtfgzYvw8JaKxBNJQeneynjZ6o1UiRiso7VKo4YrZeeXd
         g+GMtCx+VRZTmHFm46vQqZnL/yILpgKznhFkJlv9xWxkayNyHoFkcct0qXM6+gP8C9bN
         WuQJvHshyfiUE1tltsnPVQBdtQgpZD3YCeEfoW4TH0JCBAXezLjNDbx8QlL1mOGIo+8z
         ztFw==
X-Forwarded-Encrypted: i=1; AJvYcCUZwsky03iiWWLhYi9M8iRJS4herp+IAiV16BJ8l3JChcGjPtI2iIC0cZIEQv+M1103D4/cFxTE3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0yJlmVmPwVfEA9pvycrRCxvHkjLr4LeR3HEhaSdxr5xFyHxw
	Y7h8OksVLQdmwI2MsTfGP3pozQxbWJRXeZzz772vfK9gKn2ctLszEbOSTB3zIRmcwgBjlpVf9H/
	sCxRPrIQSyGfG2WvA5igCEADI1UUYw/tR8mk+R+T1s+dqTt4kL4v8DYbsLy9A
X-Gm-Gg: ASbGncuzZ/QpM7PjVTwCtSJcWMocevOajAc1pJc9RsjHGAzxUEALt2wInAIHjgDdRuG
	7tB+DyfUWn60DoQhM+d+Ilyqsff6QOLorhdRj4kQt7ZCABTQZQBdIk/sFOoZaEt7QNGH3avKTpf
	ctU8Xsp7A7h1MluknKjnXvWkpAC6E1Q4FPH27C7HilzBQw+hEEFm51bSCNPMy+zxYFTXMGX72if
	NrS3cFOUgH7ygFyfQlE63iFh4aQvYTimZhG/kFGrMRiHNLbf7kIkcmPNnyCDQDJIYeYLio5073S
	NdycP24dEEkNLQ==
X-Received: by 2002:a17:90b:274a:b0:312:1b53:5e98 with SMTP id 98e67ed59e1d1-31347695f46mr10946830a91.34.1749381337360;
        Sun, 08 Jun 2025 04:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm1tY9duQEiqT3DInIdSJiLgysCyNwHiX31kI2nR++f2zCJN2MhXR/VhrT6h4PgjvT4OdRdw==
X-Received: by 2002:a17:90b:274a:b0:312:1b53:5e98 with SMTP id 98e67ed59e1d1-31347695f46mr10946804a91.34.1749381336969;
        Sun, 08 Jun 2025 04:15:36 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f21sm38098935ad.66.2025.06.08.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 04:15:36 -0700 (PDT)
Date: Sun, 8 Jun 2025 19:14:40 +0800
From: Coiby Xu <coxu@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, keyrings@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Peter Jones <pjones@redhat.com>, Robert Holmes <robeholmes@gmail.com>, 
	Jeremy Cline <jcline@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 1/1] module: Make use of platform keyring for module
 signature verify
Message-ID: <mqciidnqf3itdh6fzz53nxvoqg3zhc2fjiwpvz46ytunsmmzrx@r3vhrnrgi637>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <20250602132535.897944-2-vkuznets@redhat.com>
 <948f5567fe4d9ae39aa2528965f123e42bf82b46.camel@HansenPartnership.com>
 <87r001yzob.fsf@redhat.com>
 <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
 <ibosm332sa2kz6vqrru5qsfk4tybsxepo4vascc3zsetmyckvv@pml7puc5jyl6>
 <bec46b16778d9292ab90b3e1c71be6c56c8a5a50.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bec46b16778d9292ab90b3e1c71be6c56c8a5a50.camel@HansenPartnership.com>

On Thu, Jun 05, 2025 at 08:05:56AM -0400, James Bottomley wrote:
>On Thu, 2025-06-05 at 16:34 +0800, Coiby Xu wrote:
>> On Tue, Jun 03, 2025 at 09:03:22AM -0400, James Bottomley wrote:
>> > On Tue, 2025-06-03 at 10:52 +0200, Vitaly Kuznetsov wrote:
>> > > James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>> > [...]
>> > > > Also, are you sure a config option is the right thing? 
>> > > > Presumably Red Hat wants to limit its number of kernels and the
>> > > > design of just linking the machine keyring (i.e. MoK) was for
>> > > > the use case where trust is being pivoted away from db by shim,
>> > > > so users don't want to trust the db keys they don't control. 
>> > > > If the same kernel gets used for both situations (trusted and
>> > > > untrusted db) you might want a runtime means to distinguish
>> > > > them.
>> > >
>> > > I was not personally involved when RH put the patch downstream
>> > > (and wasn't very successful in getting the background story) but
>> > > it doesn't even have an additional Kconfig, e.g.:
>> > > https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/commit/03d4694fa6511132989bac0da11fa677ea5d29f6
>> > > so apparently there's no desire to limit anything, basically,
>> > > .platform is always trusted on Fedora/RHEL systems (for a long
>> > > time already).
>> >
>> > It sounds like that's just distro politics:  RH wants to enable
>> > binary modules (by allowing them to be signed) but doesn't want to
>> > be seen to be signing them (so they can't be signed with the
>> > embedded RH key) so that gamers can have performant graphics
>> > drivers and the like.  Thus it mixes in the db keyring, which
>> > usually contains several Microsoft certificates and also one from
>> > the ODM manufacturer, so now it can send would be shippers of
>> > binary modules to those groups to get them signed. If you only have
>> > the built in and MoK keyrings, the only possible signers are either
>> > RH or the machine owner ... who isn't a single entity to deal
>> > with.  Personally I think this is a bit daft: Debian manages an out
>> > of tree module infrastructure using DKMS and MoK signing, so I
>> > can't see why RH can't get it to work in the same way.
>>
>> It's interesting to find that although Debian's wiki page [1] only
>> mentions DKMS and MOK, it actually has the same downstream kernel
>> patch [2][3] as Fedora/RHEL to allow using db keys to verify kernel
>> modules.
>> [1] https://wiki.debian.org/SecureBoot
>> [2]
>> https://salsa.debian.org/kernel-team/linux/-/blob/debian/latest/debian/patches/features/all/db-mok-keyring/KEYS-Make-use-of-platform-keyring-for-module-signature.patch?ref_type=heads
>> [3]
>> https://sources.debian.org/patches/linux/6.12.30-1/features/all/db-mok-keyring/KEYS-Make-use-of-platform-keyring-for-module-signature.patch/
>>
>
>Well if you read the attached bug reports:

Thanks for listing the bug reports!

>
>https://bugs.debian.org/935945

This bug was filed on Aug 2019 and the downstream patch was merged on
Nov 20219 whereas Eric's machine keyring work was merged on Mar 2022. So
I don't think it has anything to do with
CONFIG_INTEGRITY_MACHINE_KEYRING despite the bug reporter used MOK key
to sign an external module. And before Eric's work, all MOK keys were
loaded to the .platform keyring.

>https://bugs.debian.org/1030200

For this second bug which titled ".platform keyring (EFI DB variable) no
longer trusted to sign modules, regression against 6.0", the bug
reporter was requesting to allow DB keys to verify kernel modules
(again).

>
>You can see that it's people trying to get an external module to work
>(actually zfs locally signed) by adding keys to MoK and it failed
>because of a configuration error (CONFIG_INTEGRITY_MACHINE_KEYRING
>wasn't set).  They added this patch as part of the thrashing around
>trying to fix the problem because they found it in Fedora.

So I think Debian includes the downstream patch exactly to allow using
platform keys to verify custom/third-party kernel modules.

>
>Regards,
>
>James
>

-- 
Best regards,
Coiby


