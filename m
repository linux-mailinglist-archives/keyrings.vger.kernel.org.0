Return-Path: <keyrings+bounces-2796-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C7ACEC0E
	for <lists+keyrings@lfdr.de>; Thu,  5 Jun 2025 10:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB76A1898B90
	for <lists+keyrings@lfdr.de>; Thu,  5 Jun 2025 08:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7DD1BD9C1;
	Thu,  5 Jun 2025 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TREX2d0e"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED35842A87
	for <keyrings@vger.kernel.org>; Thu,  5 Jun 2025 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112543; cv=none; b=JN9zC+XGSfqfyjXq28ft6G+nf8opGsb0ZookbcAKbgKv9zuydk4NkkM3yVGz2jt40M+30pbnDye4/0qq2vHm1qxu9hLcqUdP36Mhqx6pu3GIdU6bMEIUN4PaITifbifqxjIFcBa6XybrCqzIX0RxN+AZTuME+BXO6W/Uu9v4s6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112543; c=relaxed/simple;
	bh=NRoDy9oPqPmwUYRp1IJc6lJX14zHgjomcJR0myjnx68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXwwsYvJOpFZx4mAUQkBjgcvhD2HiMHwr8BkwDtJdFKNg1FUnKA8iBykd4cM+3Fkbmx8LNFh09xTVOwyBvLacY+1QPWpLDNF+p4D757TWt/JGLsAtPzBO1RhpT7gQen2o6+FBqEHjAycaEz4+cEnPSegRfRTtfBq4jtszfmCfr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TREX2d0e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749112539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7OP291cCHEccCOVb5GqF2fJ19heqtSc19LUMzhHmhc=;
	b=TREX2d0erQu9XSW+R51sFiXxLM3oQQW2H9INe1UDuav+c5fF7QgdtIDuZVwZ3Topx8qqaE
	Ap+5ObyghbAQbx0hVqilReKEB4hgdRB6AIW/GxSEeJZcV+bHmNJlPOK/ve7cq/uo7lD90Q
	ZIBWahAmf3zaiVbePu+9NvgGJknns60=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-APIlcyJWMMWrcw4ZZBHLYg-1; Thu, 05 Jun 2025 04:35:37 -0400
X-MC-Unique: APIlcyJWMMWrcw4ZZBHLYg-1
X-Mimecast-MFC-AGG-ID: APIlcyJWMMWrcw4ZZBHLYg_1749112536
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74299055c3dso1307896b3a.0
        for <keyrings@vger.kernel.org>; Thu, 05 Jun 2025 01:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112536; x=1749717336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7OP291cCHEccCOVb5GqF2fJ19heqtSc19LUMzhHmhc=;
        b=EZXEeetWR73MA1El0mY5h88WchfdkMUIN7XQ5jQ92DkInjmWc5N5PanlyCEJ8oEZy0
         LdB9R5DgQ4xd82A1iiBcGSePOJ4zoYGSr8tOQic4z1TRcARVcuZuK2trL+dL9LuvoCU4
         g/xJANhvFwewXQbpn3caYmfu2an0RXzp81pI7MsXj3ptZ+iRGvRDYoScnedgnOWp44ca
         i/32TwRomTJie6JuzLtb837pOF+d8ZlEs84I/z5crap5dDzoLjH/IJw3W94iH/844dVD
         qqrxFeXA+8k/Yf7uCwV+iq8ETWMTa5A3SYHjRFjz59I/hro/g/xacWo7GKSHoP+kASS+
         DNQw==
X-Forwarded-Encrypted: i=1; AJvYcCX/MawEtyNkEuG1CHab72kdn6Qox33Ga5g+JRQnYZ+i79p2uNt1zdyK/R//cxp2dJIodlVUzSioPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTc2bJ3l6DZB8ZH5jO6cTOCwXcuszS0lTqhy63GoTY3P3pi1v
	KK7TG9USZMDkHUz7SMosJL2kTsgMqzI7dJFg6hGcRc6baRwSgDZjnGb3q9I2B6NStqUHWaDWD8o
	HaMtDsE/EsIMox7/ttqMFPnxjSFAbBOYncTcQ5tMOoie2I9DWkl9pevN3oY55
X-Gm-Gg: ASbGnctHWfQf73DeE1DHpB9Kb4m/PNqqeHCfKqR/Bsj9+p80Sa506s+/Q4laDq7zLez
	8vDgabcVu4sN/cjy5R/129w87V0/IkhCyvq1qQ6S4MESBfqlJht8WBQ5/QNbzzNQQPWAiOvl/ip
	jsrAH7nuo8zmeCePHvimKWrXiUg6Kbm3dMtTmLSGth5zRlYuq0i1W2RSMPFHbCiLgQ2FDtaVcmA
	L8xwemrRzqkiaRZSEtqtX5/HAzDldRCA93iTpfQRtl0OgKjWCmZiVtCMj5KJxNrfTgihmHPjLOH
	1MM=
X-Received: by 2002:a05:6a00:23c6:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-7480b2e0361mr8190439b3a.12.1749112536489;
        Thu, 05 Jun 2025 01:35:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrN0PqOUdKalMaeAG7aIgHJtiglVXWjEwD24TEHI4LYox9Gd70kryUZzyeMjHmJRalEgOnRg==
X-Received: by 2002:a05:6a00:23c6:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-7480b2e0361mr8190429b3a.12.1749112536110;
        Thu, 05 Jun 2025 01:35:36 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab75csm12734762b3a.52.2025.06.05.01.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:35:35 -0700 (PDT)
Date: Thu, 5 Jun 2025 16:34:20 +0800
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
Message-ID: <ibosm332sa2kz6vqrru5qsfk4tybsxepo4vascc3zsetmyckvv@pml7puc5jyl6>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <20250602132535.897944-2-vkuznets@redhat.com>
 <948f5567fe4d9ae39aa2528965f123e42bf82b46.camel@HansenPartnership.com>
 <87r001yzob.fsf@redhat.com>
 <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>

On Tue, Jun 03, 2025 at 09:03:22AM -0400, James Bottomley wrote:
>On Tue, 2025-06-03 at 10:52 +0200, Vitaly Kuznetsov wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>[...]
>> > Also, are you sure a config option is the right thing?  Presumably
>> > Red Hat wants to limit its number of kernels and the design of just
>> > linking the machine keyring (i.e. MoK) was for the use case where
>> > trust is being pivoted away from db by shim, so users don't want to
>> > trust the db keys they don't control.  If the same kernel gets used
>> > for both situations (trusted and untrusted db) you might want a
>> > runtime means to distinguish them.
>>
>> I was not personally involved when RH put the patch downstream (and
>> wasn't very successful in getting the background story) but it
>> doesn't even have an additional Kconfig, e.g.:
>> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/commit/03d4694fa6511132989bac0da11fa677ea5d29f6
>> so apparently there's no desire to limit anything, basically,
>> .platform is always trusted on Fedora/RHEL systems (for a long time
>> already).
>
>It sounds like that's just distro politics:  RH wants to enable binary
>modules (by allowing them to be signed) but doesn't want to be seen to
>be signing them (so they can't be signed with the embedded RH key) so
>that gamers can have performant graphics drivers and the like.  Thus it
>mixes in the db keyring, which usually contains several Microsoft
>certificates and also one from the ODM manufacturer, so now it can send
>would be shippers of binary modules to those groups to get them signed.
>If you only have the built in and MoK keyrings, the only possible
>signers are either RH or the machine owner ... who isn't a single
>entity to deal with.  Personally I think this is a bit daft: Debian
>manages an out of tree module infrastructure using DKMS and MoK
>signing, so I can't see why RH can't get it to work in the same way.

It's interesting to find that although Debian's wiki page [1] only
mentions DKMS and MOK, it actually has the same downstream kernel patch
[2][3] as Fedora/RHEL to allow using db keys to verify kernel modules.

[1] https://wiki.debian.org/SecureBoot
[2] https://salsa.debian.org/kernel-team/linux/-/blob/debian/latest/debian/patches/features/all/db-mok-keyring/KEYS-Make-use-of-platform-keyring-for-module-signature.patch?ref_type=heads
[3] https://sources.debian.org/patches/linux/6.12.30-1/features/all/db-mok-keyring/KEYS-Make-use-of-platform-keyring-for-module-signature.patch/

-- 
Best regards,
Coiby


