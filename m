Return-Path: <keyrings+bounces-3915-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ubmUOm0QdGnF1wAAu9opvQ
	(envelope-from <keyrings+bounces-3915-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sat, 24 Jan 2026 01:21:01 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 486CF7BA55
	for <lists+keyrings@lfdr.de>; Sat, 24 Jan 2026 01:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6415300B467
	for <lists+keyrings@lfdr.de>; Sat, 24 Jan 2026 00:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E8C19995E;
	Sat, 24 Jan 2026 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPqAskv8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cywcp0Nf"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FA77F39
	for <keyrings@vger.kernel.org>; Sat, 24 Jan 2026 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769214059; cv=none; b=TyGw+qQpwLIJKZGumOhllW3xNlUxUadLZVBpBEjt87a7H4QxrBLn2Rhhjx6RvkPW24Le2XtOybL4IR3u2fkKqp7vp6yoW/ctpFdaQpKmS9pMcc77Fhgi5KvWKoN1w3urkghOkKHa4HzBpEZvrA3imJLqqV2/FNipQ9kX/PUQiZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769214059; c=relaxed/simple;
	bh=j2cnf66j7Tyeo03Ht3nxIfKsvE0nQ1mv6D7kqhjkBJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLL6ksQNsfOWw2xo9zkJHt/8dok0IGhj33m+sxmEQGdMEoQRzviU+CiKSEoLG7JmbWjoE/ZjIVwpJyqV19+OKiS01DF5cnQQIZ9cTKwvzyily0MAO0PX+g10f4bTx3p8/i81RoVVrb+L9Y8NNLzd5ro3Bh1vJNhruwfRnnfVimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPqAskv8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cywcp0Nf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769214056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
	b=gPqAskv8/iuAIelkAE02Mn5AzPTZq+2afA8ZwLjZq6cnB+hM2uk9a5HD1oPkITCfuYbXHx
	+rKoOhUta5LfNYV+2z8Yy3XT9ueZYtv3n+bT9J9aGBcAaf6Ew1rZaPWdz+E0FLTZKK8Q/b
	2+LbOmXOchBuzQEPEdQ8Dlt75VTeVJw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-JtfRBTWFNrusk2hP1jqP-g-1; Fri, 23 Jan 2026 19:20:55 -0500
X-MC-Unique: JtfRBTWFNrusk2hP1jqP-g-1
X-Mimecast-MFC-AGG-ID: JtfRBTWFNrusk2hP1jqP-g_1769214054
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a76f2d7744so23237535ad.3
        for <keyrings@vger.kernel.org>; Fri, 23 Jan 2026 16:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769214054; x=1769818854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
        b=cywcp0NfT4qTxGKtlk4pEqV6LpdD2LHnGGFpE3nSVwX6aejnZN0oJvvH7X6ppckev0
         NmqEYd5Khy+qEN6tU3NtowvlifS9f5TYdQSBjOcsQCcGVc+RmvKDumIaEQEhJWwINLex
         hhqAjZWSHn2PTSZq4GxgEPdbo8qOPEufVWkNR+R+QKN3IAaysiZ/wfeRpsWD12D/pC6n
         V1+30S6cbMs94/493Z85O0QCOG2NdQRTmD8cGu5QS44aZeHChCfDkXOGWnPFH4fo19mb
         xdBm0R0HwUmQUWcLNVMGErySfUJtRKE2LcPVRXO1kGLdRVehd/EA0YoR5sOOoRjQmZca
         8AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769214054; x=1769818854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
        b=UqdPxVoR62kUTCECJeOvesqbXro3y4NS7lBTwh6y/nePlmNd1AXsl5dHI7YBnFUlJD
         Qqj8vNV8C2rsLt/pazwHp0wJbbA85mC8oaerxXHA4xudFOdvU9bG75auXf3Lp5Tr/1z7
         kiQP57FsXkoFdUJJjMPNtEqj7bLe/1kheKjYz9bRiC6IPrUAqHtsUczNgyjOgG/5J3Un
         glK9y/6oT/Vanodn5HlCxIGIx9DGiSeA2yjvhJqfcvDLqrJ769slaPWdXME4barghvk1
         rqSC2DuT/Bm/qFaYQEWX1wViIPMM/sFdyKZ+A8SpWoxLjdXuyYX4OIAHbC5iAuFR/abB
         M8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUkjPkblLvhHwE0M/BGlRshbIbBJ0QaOsxht6sG3ixKflQXoJ2rWxaQY+bzIa35mDeWLt6k6lwmVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyByFr9IpZuWxpc6BJtO15AeRgCOyS8aBYZwQHOBaUG3AjCBvXi
	IIe8UXEMYcsR7vS1BZ9pfe6e38CwLnIwoGMWbqwvX14sB2i4UuAE09sOtIJAG1hn5lE1YGtBNoV
	aGG27FtXjpEBfJ2yYBnLMp9jzMfL0UG8co53PaNlxjgr+hrgiB3SBb1MKFY01
X-Gm-Gg: AZuq6aImJv0DOOgGSxVF+6DQbra18IZDyc9Co2k9KRw7gF2Vr7wUoq75812rTQqQmxf
	BbjPbTM+fJMZCvtosIaQ08QR2K5YmIxWwEBHfmCoQWX0JNUKUuy/wf9JNX25HtS5e8GRi0v5dDp
	bjbvkFZu1d2oAd4U4k9vcPxge/vzDvsvzWxE9t5lo8ze74yxljMP7z1rxvifvdCvrP0umGk8BCL
	00jyaWfQJHoFvHKOxfZ3tbx6CrC+iNBA3IH1sJXAHHB9u+wGeCIom8EoLe/IoHU/JkpZL3NPZ0N
	97+sWqhZ94ac6zx8KwxljqsSzL491UgHCqQeFk/JTsCfSey9JFByXkt9gK8plvu75Hn6HKGUxNb
	R
X-Received: by 2002:a17:902:e54d:b0:2a7:682b:50ac with SMTP id d9443c01a7336-2a7fe625118mr44257295ad.28.1769214054340;
        Fri, 23 Jan 2026 16:20:54 -0800 (PST)
X-Received: by 2002:a17:902:e54d:b0:2a7:682b:50ac with SMTP id d9443c01a7336-2a7fe625118mr44257045ad.28.1769214053812;
        Fri, 23 Jan 2026 16:20:53 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802faf6f9sm29695045ad.71.2026.01.23.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:20:53 -0800 (PST)
Date: Sat, 24 Jan 2026 08:18:46 +0800
From: Coiby Xu <coxu@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-integrity@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <aXQN-ZNhT5olbf6X@Rk>
References: <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk>
 <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
 <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3915-lists,keyrings=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,linux.ibm.com,huaweicloud.com,arm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,huawei.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,keyrings@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 486CF7BA55
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:25:39PM +0100, Ard Biesheuvel wrote:
>On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>>
>> On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>>
>> > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
>> > index 976e75f9b9ba..5dce572192d6 100644
>> > --- a/security/integrity/ima/Kconfig
>> > +++ b/security/integrity/ima/Kconfig
>> > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>> >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
>> >          bool
>> >          depends on IMA_ARCH_POLICY
>> > +       depends on INTEGRITY_SECURE_BOOT
>> >
>> >
>> > Another idea is make a tree-wide arch_get_secureboot i.e. to move
>> > current arch_ima_get_secureboot code to arch-specific secure boot
>> > implementation. By this way, there will no need for a new Kconfig option
>> > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
>> > concern.
>>
>> Originally basing IMA policy on the secure boot mode was an exception.  As long
>> as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
>> you have any issues with replacing arch_ima_get_secureboot() with
>> arch_get_secureboot()?
>
>I don't see an issue with that. If there is a legitimate need to
>determine this even if IMA is not enabled, then this makes sense.

Thanks for the confirmation! Here's the updated patch
https://github.com/coiby/linux/commit/c222c1d08d90ef1ec85ef81ece90afc9efde7937.patch

If there is no objection, I'll send v2.

-- 
Best regards,
Coiby


