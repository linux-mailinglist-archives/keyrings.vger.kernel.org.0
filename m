Return-Path: <keyrings+bounces-4001-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NJ1K8eXgGnL/gIAu9opvQ
	(envelope-from <keyrings+bounces-4001-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 13:25:43 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29090CC557
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 13:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AAE93015871
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 12:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81637366061;
	Mon,  2 Feb 2026 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cXUrTXQj"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06E36604A
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 12:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035111; cv=none; b=YfBG3AppqVErGzknKCFG9lcNZ1NJj//nF+1EmM1p3lHXp6EWgbQGHfBJHDP19X+vxqE3jDEfTHYny68Ob2gOY3IOaqs7HyxSrKJgQt9PLh7LcUDTH+wMYCYHkuauixj/1zyd/Np1UWaWr5mozzE5gV54hArT3lWltf4P6whJ9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035111; c=relaxed/simple;
	bh=P9HHPCfdzr3+7KcIG4nqWi/NFF0xphh1hN2q0+DqS+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1XcqCMs7DGQ3RyafZb7272I06ovT3YLfSlef4lkfq6RRRFcYGQzy3LfHjLEnfHkBRIEZSilj4TWaD/8RONKSnUkB/GpLA92Xf4DxA94uVmGUZJsTZPdCfvCz9h1K6ZsfaAJ2xU2IAUy9wqSZCUHz2gZtgodAUMU8id05qmAzdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cXUrTXQj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fed090e5fso3506708f8f.1
        for <keyrings@vger.kernel.org>; Mon, 02 Feb 2026 04:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770035108; x=1770639908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35SCFxgP97C5MCjGFWH+I8SFYnEJmlfx+QRFsAL723s=;
        b=cXUrTXQj+EywFnrxpcm5ZMZ0Dpj1SrEdRNgq/FIbG8qJiGdhE3xBVOK1TyNKVC5yHM
         /YU4Rp6jcWu4EgREG9LUsb70K6+NleBSiFi5Y532AJZYt94kyWiCH7duiPY7ADITTgMA
         IW9PEEB54V/S0ubsl6TsLW/4VVNbEudOpBUOff9sJreEaYHxQhAxNFQIqtECkfn+IaYe
         1qZOIec7ST2haJWciKJjBvrg+Nm+Gn755hjsc4yMIh5F92SMFKWOt1mcWDEGu6VjHu8F
         6C2+EPxqtgIQ0mv3KvCrVgsoRjQ1QpvjgCpIDNk4uUvfQ3XBkeEqQMpXvOU1I3nfzYkN
         /now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035108; x=1770639908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35SCFxgP97C5MCjGFWH+I8SFYnEJmlfx+QRFsAL723s=;
        b=jl1gScENRAH7zsBdXcRPsgtpB0WrV9xTqUsFbimrg+OJS2XayimVy6AaefaD7/O2XN
         TjeRdWw1kk3B5JdO/v9HQuvX9CNSwfH9krIEqrROuITjm2kvOo7g6ln7HTNH8609fYD7
         yReY+rWT1Dl3xGRQOp2YWFcxPADCCmpv0qzfpqJTcMABddsuP4mTakbGP84Z7vLo6GHB
         eNwTjAPNMgIeWrM5fL1L6U07G91Z4jezze6OECZWNPvYaQmqbKvjJW5+sO8DEDnbHBP4
         LRBpUyZYjq2cE33Jg2QCgS080PUzLs9evvKXEMGPGbSOQ6WxD2s3oAazo8q/3t7r7VNI
         sg8g==
X-Forwarded-Encrypted: i=1; AJvYcCWCVkUpeTFpen+p9VGQcnfYn3IPxcjski3PAtlUlUr+cGHymmfeMc5X84W8p/beXrsbKYcK6yYepg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5sE+xNVxKLs2cBMpjinfKLy2vyq5y2hMS8Sph9l0jj97EHWO
	LNBjM9wnTkVjLsd3qZuJ1S0snYKhq81rXBg22F1FBnmTQPj92X0qU8+MfZvKk4MiW6I=
X-Gm-Gg: AZuq6aIvxFA9AntPhN5x6K6oqBivAka16LZ42FrEVFTcbYakclzmOYpLXmcoole1n1q
	lC8KCBH1Ih9yewWQQwYMNIrAefp0IV+smRb0sYO8IXadj/zJer/fe4x5hxPl6da8zm5wNWUlyK7
	C0VBKF9xXBRo45/ORH2Dc6vUfjOL+Doh/a2/PXN6ri3I1wPUdaNXmtCFPzvzwZ/CQL25UBXjII3
	sCW94TmMun4EbAkg2iRoRWgzatceHNbGvuE7bVynsqnqWgKfPYFb4bqXX7tBhJ7oniyqv+5RQie
	0dVIjrQVBDSrMvXqP5FozklwfPOYMIboUyNzLkJfP9EYh0xvVHX3VkjHb6W3ZY6VObMqLHRWMjw
	HH+XPuFPzjMTHtCe3FE65FA30/GYDtl8dSnqtGKCvBN/+WyRhiSaNb8qEwVL2Pb2w5LjYNLyO8P
	4p2fcikqwqDorQIIX9X0hIwHOwe7Ln6g==
X-Received: by 2002:a05:6000:2881:b0:435:94c1:3713 with SMTP id ffacd0b85a97d-435f3aaff90mr15459978f8f.37.1770035108092;
        Mon, 02 Feb 2026 04:25:08 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322eefsm44791754f8f.30.2026.02.02.04.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:25:07 -0800 (PST)
Message-ID: <640c124e-0f03-4869-80fe-20c8be7aa525@suse.com>
Date: Mon, 2 Feb 2026 13:25:06 +0100
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sign-file, pkcs7: Honour the hash parameter to sign-file
To: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251111154923.978181-3-petr.pavlu@suse.com>
 <20251111154923.978181-1-petr.pavlu@suse.com>
 <2403737.1770031462@warthog.procyon.org.uk>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2403737.1770031462@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4001-lists,keyrings=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,keyrings@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29090CC557
X-Rspamd-Action: no action

On 2/2/26 12:24 PM, David Howells wrote:
> Here's an alternative patch that will allow PKCS#7 with the hash specified on
> the command line, removing the SHA1 restriction.
> 
> David
> ---
> sign-file, pkcs7: Honour the hash parameter to sign-file
> 
> Currently, the sign-file program rejects anything other than "sha1" as the
> hash parameter if it is going to produce a PKCS#7 message-based signature
> rather than a CMS message-based signature (though it then ignores this
> argument and uses whatever is selected as the default which might not be
> SHA1 and may actually reflect whatever is used to sign the X.509
> certificate).
> 
> Fix sign-file to actually use the specified hash when producing a PKCS#7
> message rather than just accepting the default.

Is it worth keeping this sign-file code that uses the OpenSSL PKCS7 API
instead of having only one variant that uses the newer CMS API?

-- 
Thanks,
Petr

