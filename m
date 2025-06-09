Return-Path: <keyrings+bounces-2808-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F71AD1A1C
	for <lists+keyrings@lfdr.de>; Mon,  9 Jun 2025 10:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0886E3A6468
	for <lists+keyrings@lfdr.de>; Mon,  9 Jun 2025 08:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E0F22AE75;
	Mon,  9 Jun 2025 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cKsRQe6d"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EEB20FA97
	for <keyrings@vger.kernel.org>; Mon,  9 Jun 2025 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459488; cv=none; b=P+HBL+A/zQTpHdqKcIobJy9W7sxXQoPHR3pbdJydLB0OWkW330WtloTqRljAISCPq4kd/ZacTK+xTpyHvXbBDw0DqL7huMJnRa32iT09xu7PPd/CgeaHyrJdPRvJiob2Tn2UCEwf/wofzM4s3M+zbkoLTh8jYl80LmugFx/68oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459488; c=relaxed/simple;
	bh=tObexuNu5puy0S/zrHD6bJ96PlTpeqIfPPG17mA0siE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=en1nLGI7TO3ogIH6baki/746aGf51r0+ukW9SoTeOrHeJGDmvmJloDLgV7uzLHk5aaWF5lrLsIG9sPjTlBxwAtvZGbmC1dPi3XCbvPomVm8qCMjLSKo6aWT5jwSkdit0PAh+uqze+iTy1Xv3JKhBzhTq59LF+qozYEmcHxi9GpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cKsRQe6d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749459486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EAX9gR6Ry+BCiLbmBNWFHsPfQj/lBkDp4XOdgquTNsY=;
	b=cKsRQe6dUTDzZ/u7ywx5Hh+KHOVIw4dLuQUWZkZXaJkI7I4nggKjmF+i2W/Aq8TPbHAA/J
	87Q25IWnG06oCMKbXQK3JqP0pNvUkIXXXjncduR8aXvUSaWLrzgsWHs/YRqj9THmOqha+C
	4qua3RKkow0D6VoTV0sVEBT1ML61GRU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-6IGr-ww4MdmeBG02GPnt-g-1; Mon, 09 Jun 2025 04:58:04 -0400
X-MC-Unique: 6IGr-ww4MdmeBG02GPnt-g-1
X-Mimecast-MFC-AGG-ID: 6IGr-ww4MdmeBG02GPnt-g_1749459483
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50816cc58so1228978f8f.3
        for <keyrings@vger.kernel.org>; Mon, 09 Jun 2025 01:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749459483; x=1750064283;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAX9gR6Ry+BCiLbmBNWFHsPfQj/lBkDp4XOdgquTNsY=;
        b=ReBG0O3x/eu0T8WE9vPz2VU6TGVAdEYuowlW5V5KPG66tXj87Xu0OGBaGH7rIy3VT+
         xG2I966psfwhCmdOM5YtbbP/S4JkJeJnuZqoLeDs/IgySaeMrzR2tWlmpikhT9D4NK1S
         VNeO11QG7A9JiWCRogoWBOtj9uD1cZzBZ/Y/+CINy2JntzI/v+NHj5ijJn1tFSFoKyMI
         PQ52nn2gPI0kmWyGIIFkPswgiIK/ZT5ku5k8GEqHMcVrENMB+9sjmMtqwAeqgKXDk0l3
         Cr9kJyYNwaVwCV4nCzevN3voFZUJ1kfmf08Xd39pstgzK9tr0xyWhiPWQatQQmbJTf8Q
         qcZA==
X-Forwarded-Encrypted: i=1; AJvYcCUysHlK3a+G8DvV3VTJeSCTXwTOjcoXshi3gs/XB/TPyqKOw5UEMKLKtIGm0zhMaNnhS07KWoP9WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4B5xdfcVG8mZ9pnFPOxYCR42PND+xzn13R8oTfZSBg/Ys0e8a
	wT0SGSl5EtAcCfwKNrGMsCj9HzYq3walNCErilmA/b26d5+kI5NFxAeLvCVMmiAEymKqrCSoqG3
	4wVTfK5D4hRkvDiCXg9N7TJqYNvfTuTTwmFc0qpWKByDNTOi/lWtJQAPeLGb5
X-Gm-Gg: ASbGncs+HUQ68QxANFtvIevHI5KYx1VhrAUR36cLmWw9/W4Q0sWe500z0z2L2wxdVLk
	nphfmGJQwPcLSkuqvMmxMQRPxkLw5E1FwwxfycnzhyQ5O7uAjMxrN7f06q6Fy2drl3uUPgah4EY
	N507kyUkUvL7D8E641+J8oa4FeCeMcpC9xsIlsR/F18aiw4+aXNgGmy87vZNy0fMmgdwdytu+8s
	J0/Ov/tXHskJOmer1wQuneDUvcFKJjLeip49atIEmyGtQIuGHvRunpN1s/Kf4/qn+TmIpq/mbMC
	rtSyo0k=
X-Received: by 2002:a05:6000:420a:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3a531cf5be1mr8000735f8f.58.1749459483390;
        Mon, 09 Jun 2025 01:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGKstU+gvDYJRoCuhWj9Uy3B0R5FuTJdpuAKJpWIzyKGQze6gxwv3jbQl0SI7KqRYCXE0l/g==
X-Received: by 2002:a05:6000:420a:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3a531cf5be1mr8000722f8f.58.1749459483016;
        Mon, 09 Jun 2025 01:58:03 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323be604sm8881091f8f.42.2025.06.09.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 01:58:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, Peter Jones <pjones@redhat.com>
Cc: "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "linux-integrity@vger.kernel.org"
 <linux-integrity@vger.kernel.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "keyrings@vger.kernel.org"
 <keyrings@vger.kernel.org>, David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Robert Holmes <robeholmes@gmail.com>,
 Jeremy Cline <jcline@redhat.com>, Coiby Xu <coxu@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 0/1] module: Optionally use .platform keyring for
 signatures verification
In-Reply-To: <a9bb8b0cfd1af85443ff8ee615b3be0fc705ce02.camel@HansenPartnership.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <0FD18D05-6114-4A25-BD77-C32C1D706CC3@oracle.com>
 <f0b37bc55ed3c02569c74f0fbdb6afa8efd329e2.camel@HansenPartnership.com>
 <87zfemoc76.fsf@redhat.com>
 <e4e838d03b3619df5523d429e0cd8160a8aef9f8.camel@HansenPartnership.com>
 <87tt4unw1w.fsf@redhat.com>
 <a9bb8b0cfd1af85443ff8ee615b3be0fc705ce02.camel@HansenPartnership.com>
Date: Mon, 09 Jun 2025 10:58:01 +0200
Message-ID: <87ldq1nvfq.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Thu, 2025-06-05 at 15:43 +0200, Vitaly Kuznetsov wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>> 
>> > On Thu, 2025-06-05 at 09:54 +0200, Vitaly Kuznetsov wrote:
>> 
>> So far, I got two 'runtime' ideas:
>> - Observe MokListTrustedRT and distrust .platform when it is
>> non-empty. This can, of course, be combine with a Kconfig for those,
>> who do not want it at all.
>
> Well, not sure about that specific variable.  It seems to be set but
> not used by shim (however it is used in the kernel to decide whether to
> import the MoK list), so how would someone with a current distrusted db
> get it set?  But there's also MokIgnoreDB (which is actually a RT
> import of MokDBState) which is used to prevent importing the db certs
> into the platform keyring in the first place.
>
> I think the reason this is so fragmented is because we didn't really
> co-ordinate with shim when all the variables and switches were added. 
> Perhaps we should document all the variables and expectations before
> deciding on a mechanism? 

I was hoping Peter (pjones@) can help us here) Generally, I agree that
as these variables originate in shim, we should describe them there and
not try to give them some potentially undesired meaning in kernel.

>
> The one thing we can guarantee is if the cloud use case is booting
> without shim (is it?) then none of the RT variables will get created,
> so checking any (or a set) of them would work.

Personally, I always advocate for injecting shim in the boot chain at
least when distro kernels are used: shim provides SBAT revocation
mechanism which is likely going to be used when a new secureboot related
vulnerability is discovered. SBAT was used for UKIs only but a mechanism
for embedding it into the Linux kernel itself is coming (already merged
for 'zboot' arches, pending for x86). If, however, someone is signing
his own kernels and can use 'dbx' or even revoke the cert in case of a
problem, then I guess shim can be avoided.

>> and/or
>> - Sysctl toggle. Keep things as they are by default but make
>> .platform trusted (either for modules or for everything) when
>> switched 'on'. This can (optionally) by combined with a previous idea
>> and have e.g. an 'auto' state for the toggle which follows
>> MokListTrustedRT.
>
> I'm less keen on user specifiable runtime because the security policy
> of the system using a lockdown to make root less privileged than ring 0
> can't allow a malicious root to weaken it.  However, let's see if we
> can get a proposal that would mitigate that concern.
>
> Ideally, if we can get to something that works for everyone at runtime,
> we can remove the current Kconfig explosion which is definitely adding
> to the confusion (as shown in the Debian bug reports).

-- 
Vitaly


