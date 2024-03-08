Return-Path: <keyrings+bounces-825-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734DB875E55
	for <lists+keyrings@lfdr.de>; Fri,  8 Mar 2024 08:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 913F91C219B2
	for <lists+keyrings@lfdr.de>; Fri,  8 Mar 2024 07:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1190C4EB4F;
	Fri,  8 Mar 2024 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="wY2EXBE3"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9E4EB47
	for <keyrings@vger.kernel.org>; Fri,  8 Mar 2024 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709882270; cv=none; b=cDbfgg7iH7kNb0gEZdcxK1mHWg50IfRdtQFNYY88DDYBdv5HKUbgXhY+DEzbMR+rr0k9gEu74dqV8MgZ2Xgo+0v4Wa1JL89VznR1sFAnj49UVQOY4XjSSXcfp7K4+Q0KVPO98PGC4hkKlWulAZ6HVWfaDoTl8GPLNHf1adTR/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709882270; c=relaxed/simple;
	bh=7YvX8bPEV2BI0BpF/k+pwUbl0NZXlnKf36uLhchuK3c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tPadfrWSu7BaGqxISgpa9UB49xdClQArU9wtON9DTVZ+E4drg3rIWXS9gaJncz6FwkUvxVX1TUAw6YxltdEdQQJCGy0W84taBXYk/2b7yzfs7Cy5UVm+598VudYd3Z73+3nPPdsiHR2/rgTcjn30BUSUaPCUM0O74wpgNyNS7D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=wY2EXBE3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5654f700705so2133197a12.1
        for <keyrings@vger.kernel.org>; Thu, 07 Mar 2024 23:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709882267; x=1710487067; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YvX8bPEV2BI0BpF/k+pwUbl0NZXlnKf36uLhchuK3c=;
        b=wY2EXBE3RgnvRgIRgvNXAu0XaxznWS/lRKYE/yZan4fyg5gNzBdcUrM04WdkGqHVB2
         mjQZaq4d1yfvCqEuFK90mCV88VaUxF7hXrtsiJjPs70czaeKzim1k14JncL+ocDaEgcn
         2UMDciaIaSSChda5IM78oSxkGOBtmHfXsGbWkkjYnG+UtJyMITmL+a21fGtdgm1LIFfY
         hoghNkLCbD0R3yj1h6fMTBEa4p6aP33cgR+h/MHI/v0YR7xWVh+rHKSLoF9D1/xZW6t1
         p6e3rtX0xTONQuGCN5B5niLgD3J4t9L8WA5FiopdLHuJjKJD31MDladddp3JQPUcIZ2M
         +I6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882267; x=1710487067;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YvX8bPEV2BI0BpF/k+pwUbl0NZXlnKf36uLhchuK3c=;
        b=UIWw2EtEoignMrunu3mH9lS5GuAdq2rJRzf19cWmzJCbfhN+g10NQCdYpeMHCLYLPW
         YsPwrieV1vzjlPBuwHjbYqd1eUz0gtteAtigxRH6T3RvOfatWVVXmbB1QERWJCgzrAcd
         BzCPI6HNo0DzWqc+4mt2RirDxphOQpLpMNtjoUQjNTwSVDosXqqY/FdiP4MVEZwd0DKn
         j8kwYZTWZgqhGMsRTdxm36D8PE7hrTdQw356xNiZ2BPwgdlURz2RFLXm4F2kcOGm4RA3
         AtVUNtcZU0LLUXlQ+d3ZEfeAPRWlI0j96t4CaRbeoyYQjHCGZF62UV8rhg7cKQaPNWyB
         5LMg==
X-Forwarded-Encrypted: i=1; AJvYcCWc3FdiucvCStgN8eOfTRs9/faBox+uqUS/2yIOvaYdNam9y71TiegZuYWwx7guPG7ynPS/Jnjj1mJpiBQI3mSWb8DNHYQS7JU=
X-Gm-Message-State: AOJu0YzeMhENlmfIZ0KfETYIB+laKK9x7J5Y0VDzLYbZJ8Y2Mle9YnVZ
	PRMLr5u70qBM8Wkt8M2PG4psjkF4+ByVJ0kiBqTmTDmyTLYXiVVmUGDATqD3No0=
X-Google-Smtp-Source: AGHT+IGiGod9W2YM4YZ6sUKkrNh7qVjymDesOFOXF8mtdCcbqIFTzGM2YQaR07gH4KtP9j0849dGZQ==
X-Received: by 2002:a17:906:339a:b0:a44:ff95:3911 with SMTP id v26-20020a170906339a00b00a44ff953911mr11831490eja.66.1709882267100;
        Thu, 07 Mar 2024 23:17:47 -0800 (PST)
Received: from smtpclient.apple (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with ESMTPSA id f27-20020a170906085b00b00a44ef54b6b6sm6582541ejd.58.2024.03.07.23.17.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2024 23:17:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v6 3/6] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CZNRMR5YZPQO.1QBLW62A6S840@kernel.org>
Date: Fri, 8 Mar 2024 08:17:35 +0100
Cc: Mimi Zohar <zohar@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Shawn Guo <shawnguo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 sigma star Kernel Team <upstream+dcp@sigma-star.at>,
 David Howells <dhowells@redhat.com>,
 Li Yang <leoyang.li@nxp.com>,
 Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Tejun Heo <tj@kernel.org>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <655221B7-634C-4493-A781-CF014DFFC8BF@sigma-star.at>
References: <20240307153842.80033-1-david@sigma-star.at>
 <20240307153842.80033-4-david@sigma-star.at>
 <CZNRMR5YZPQO.1QBLW62A6S840@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)

Hi Jarkko,

> On 07.03.2024, at 20:30, Jarkko Sakkinen <jarkko@kernel.org> wrote:

[...]

>> +
>> +static int trusted_dcp_init(void)
>> +{
>> + int ret;
>> +
>> + if (use_otp_key)
>> + pr_info("Using DCP OTP key\n");
>> +
>> + ret =3D test_for_zero_key();
>> + if (ret) {
>> + pr_err("Test for zero'ed keys failed: %i\n", ret);
>=20
> I'm not sure whether this should err or warn.
>=20
> What sort of situations can cause the test the fail (e.g.
> adversary/interposer, bad configuration etc.).

This occurs when the hardware is not in "secure mode". I.e. it=E2=80=99s =
a bad configuration issue.
Once the board is properly configured, this will never trigger again.
Do you think a warning is better for this then?

Thanks,
- David


