Return-Path: <keyrings+bounces-2802-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61689ACF26F
	for <lists+keyrings@lfdr.de>; Thu,  5 Jun 2025 16:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA6B17A7CC
	for <lists+keyrings@lfdr.de>; Thu,  5 Jun 2025 14:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F891A3145;
	Thu,  5 Jun 2025 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StUukNQL"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC52C324C
	for <keyrings@vger.kernel.org>; Thu,  5 Jun 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135369; cv=none; b=IO5S7lTHmr7oo6WQHvvXovdnn/7duSbVcSsRMb264wPngEtxyq2mTyT91q1VV77sCdyNZOwvSxAu4SnBE8Q0H9C9KZsEvLlxuYbE+ELs8+TyspzwyfRQ7WtLIAgtUuLwMeSe2G1WbguJ0tuP6uuga8OnQkewvaqHDwDvbHicO+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135369; c=relaxed/simple;
	bh=DHu18rmA0sU7oZNUXhtODTBETFCDhL2OEUU38uuVFxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HhYwc963RxFrouAcjboTvCx5a3haMtRltFjVJrxiGI/jooZgylxLEkyYJOidxvvI+PfPAbuSWHYYpj/fyA73j52uwB4RieEU8E38UKpsOAgqRUxRSOMHsaaWI6KiYmcKpS4gkxNj77p84T7wmzPgR9m/VmohNXDrGe6oKgEHzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=StUukNQL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749135365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFA6j3WG2u6wCRFKF+JPzUGEfqC8djtrecvjhVi86Lo=;
	b=StUukNQL108Y6Evi54eeZAqEf18d4Ah++jZclxB90nls9Cx2LO3Id54Q5fpM1Abt8KkR3g
	xIHgdK7RIc94+17ieDu9KEyfwS+qP5SFsOFP5P2JQ66yOz4fjEcXd/E63sXh6J4NoWV17J
	4kFE72t9uhzrHdicn+pCWUxkUEHEivc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-T4Wcu-uZM-2IcIr2Ag_NJw-1; Thu, 05 Jun 2025 10:56:04 -0400
X-MC-Unique: T4Wcu-uZM-2IcIr2Ag_NJw-1
X-Mimecast-MFC-AGG-ID: T4Wcu-uZM-2IcIr2Ag_NJw_1749135363
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso871775f8f.0
        for <keyrings@vger.kernel.org>; Thu, 05 Jun 2025 07:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135363; x=1749740163;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFA6j3WG2u6wCRFKF+JPzUGEfqC8djtrecvjhVi86Lo=;
        b=V/YQHcvIKlks7NOjizfsv+HacA3TzjoZ78XFPq+tMUeZFhxrgZRTzOxHWyRWog/i9s
         hDDoqSKH43bZldMdkpW6sDubhdnMdBHxEg0VYQHYpbQeEFxBdJ5fzyHttF7qspO/L5yt
         M+WH/gtqw7TagDTtszE+MCBHZ+GSLoWsCYILSxJNPX+ZVT3MQCLvREwbOEt+9K0dok90
         EtmaRZUsgzFDA1CTNRcAqo/6EHKoirr7OZShi4H7vjaxoy+N0k294SzMWYm5utBlMn1p
         vIANsFG84o/W7oYnGnrcwRgXKJYbA+2pCcIxe87iXgAQXAvmIjY2Q+IB2jwntB89fXfb
         PhWw==
X-Forwarded-Encrypted: i=1; AJvYcCUT51/NnfwH6dBgvSmnXPX0P4nSDfNiv+7mAb8B1SCSLO0nQ4xiVg49OVgiK+6v6oZpAyvaLEK5gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJoakThcn0DiZvw6ITr+shhzVO8LwH+HpkWtEFKrCAN1Wpczq
	hCWmpHv1OMjuRm6KUGhnR5ClxCfvFVnazAgM+HCsldlneRaK8EWjpZZiGsKwFhJT9eXOBaSgPeH
	JI3n0nj3CdNCPMthrMivgwaTjatdutHfEcpTWIbQyY029931j6HgyOZ5O+EWZ
X-Gm-Gg: ASbGnctu5R1186I7MSNiG3cHYmbeu18ec5eki4cbqBmCBpksVg3YIbeBKbfT7KITd0P
	mAWBi5Juy8zmDuICUatQQbF/aNHRXdAqkwKQi08coKw6rgujPQ52Grp1SPqZblPiXZkQqK/l8uJ
	IDRRBomp3LK0Iz17CC/MyKWrNPDxgURhovcwvYXMg2jG6E+H8DZIlFZ1kFNxAxSnpMI2ORbu4nE
	t9YIgiAjH70T9TXW4A4cO07oK+Zq4adRiDzYPtEMoML2dHGydDF38N5AS/vcgvTiptFq8viubzD
	dLUMrIMqQi8f2oTgUA==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr3061252f8f.32.1749135362796;
        Thu, 05 Jun 2025 07:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA81c6wZglVzh0Z3/rZiV4JQo/XmLeKsTiTnUWO5wj0USvJJ+iJpt9siQ/hlalGpRgG5o3Zw==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr3061215f8f.32.1749135362368;
        Thu, 05 Jun 2025 07:56:02 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm27314005e9.23.2025.06.05.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:56:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "linux-security-module@vger.kernel.org"
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
 E. Hallyn" <serge@hallyn.com>, Peter Jones <pjones@redhat.com>, Robert
 Holmes <robeholmes@gmail.com>, Jeremy Cline <jcline@redhat.com>, Coiby Xu
 <coxu@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 0/1] module: Optionally use .platform keyring for
 signatures verification
In-Reply-To: <435F53C6-DC08-49CA-AA36-9747FC1B50DF@oracle.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <0FD18D05-6114-4A25-BD77-C32C1D706CC3@oracle.com>
 <f0b37bc55ed3c02569c74f0fbdb6afa8efd329e2.camel@HansenPartnership.com>
 <87zfemoc76.fsf@redhat.com>
 <435F53C6-DC08-49CA-AA36-9747FC1B50DF@oracle.com>
Date: Thu, 05 Jun 2025 16:56:00 +0200
Message-ID: <87qzzynsov.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eric Snowberg <eric.snowberg@oracle.com> writes:

>> On Jun 5, 2025, at 1:54=E2=80=AFAM, Vitaly Kuznetsov <vkuznets@redhat.co=
m> wrote:
>>=20
>> 'certwrapper' offers _a_ solution which is great. It may, however, not
>> be very convenient to use when a user wants to re-use the same OS image
>> (e.g. provided by the distro vendor) for various different use-cases as
>> proper 'certwrapper' binary needs to be placed on the ESP (and thus
>> we'll end up with a bunch of images instead of one). 'db' is different
>> because it normally lives outside of the OS disk so it is possible to
>> register the exact same OS image with different properties (e.g. with
>> and without a custom cert which allows to load third party modules).
>
> Could you please provide more details? The kernel module is signed with=20
> a specific key. The =E2=80=98db=E2=80=99  key in the cloud image must mat=
ch whatever key=20
> was used to sign the kernel module.
>
> Why can=E2=80=99t the RPM package that contains the kernel module also in=
clude=20
> the required =E2=80=98certwrapper=E2=80=99?  When the RPM is installed, t=
he appropriate=20
> =E2=80=98certwrapper=E2=80=99 is placed on the ESP.  There can be any num=
ber of 'certwrappers'=20
> in the ESP. Doesn=E2=80=99t this solution address the issue?

I think it does but let me elaborate on where I believe some (minor?)
inconvenience comes from.

We have various actors here:
1) The OS image which is coming from a distro vendor.

2) The user, which takes the OS image and registers it with specific
properties (including 'db') with various infrastructures (e.g. different
clouds).

3) A third party kmod vendor which produces a module compatible with the
OS version. The module may only make sense for certain VMs on certain
clouds.

The customization of the VM normally happens upon first boot: a generic
image from the OS vendor (1) boots and then some provisioning agent
(cloud-init, WALA,...) takes over and e.g. installs additional
stuff. This additional stuff may include third party kmods from (3).

The 'certwrapper' must carry the key which the third party vendor (3) uses
and it must be signed by a key which the user (2) put to the 'db'. If we
want to have the 'certwrapper' shipped inside the same RPM as the kernel
module, it will be signed by the same third party vendor (3). While this
looks a bit weird ('self-signed certwrapper'), I don't see why this
can't work.=20

Besides the need to teach (3) how to build certwrappers, an inconvenience
in this scheme comes from the fact that to activate a 'certwrapper'
which we install from a custom rpm, we need a reboot. Cloud instances
often back burstable workloads and this can be seen as annoyance.

--=20
Vitaly


