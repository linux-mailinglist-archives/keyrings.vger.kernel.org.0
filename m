Return-Path: <keyrings+bounces-1267-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28C8C8C0B
	for <lists+keyrings@lfdr.de>; Fri, 17 May 2024 20:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70C91C217F8
	for <lists+keyrings@lfdr.de>; Fri, 17 May 2024 18:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E22213DDDB;
	Fri, 17 May 2024 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="SLZenIlm"
X-Original-To: keyrings@vger.kernel.org
Received: from sonic311-30.consmr.mail.ne1.yahoo.com (sonic311-30.consmr.mail.ne1.yahoo.com [66.163.188.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEEEEC5
	for <keyrings@vger.kernel.org>; Fri, 17 May 2024 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715969016; cv=none; b=edmX+FuErVoQTOs0DOU4kfChyw+6BPjivZcXtZX91o7Ap/BiYGAnIcwtkYpu8oP2l+yJ2aSQLh1A7GkSjR28foqpi2l4bSMG4ya0DD1pbw35ImAaj25gkvf2PRr8rioK8evkzFUnQbRNEbxr1/wqutJ6J5MP1+Xz2kOlvGB6YKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715969016; c=relaxed/simple;
	bh=put+y5/J/5Kd8zNeqN0yRq4nqLEYAbVcLkKYZS8ZTpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtlLzDU6KGvP/r5aXIjDnJ2EqPDMuQkfySDjoBInD03QDWMCTiXmpkGfGZsMtYwCRgGO8kE5X34JLOuI2Bo86VcDp0qljMfN1bYe+GV23D/EXvjFgLbU5xvlJR0yylYKMXi06a82kQ2aRcx9sliDymj+iP3RWbt0kBhwTUtvbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=SLZenIlm; arc=none smtp.client-ip=66.163.188.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1715969014; bh=tIio+RNaO0tAS6S6sNhPnuxF8pniQ2kOR7PgXrhSanY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=SLZenIlmVtmyzCw9/jawLtthw1wnJWcaPWr11kfmoO/H/kFqWYWI1CKKHNSWp5TNtbAzAqsiPgzCzbzW4NtXtHpgfghik/gvBOxcrXxtJFNiXfb9xTsyIwakVt5fwLGis0EBC1NDRe1Z1snZ1yQ55F26XjGPdDUFzpBUKtNZexauQ/eOauqUwcXuDYmp0mwq2oBebUXE3cDzOIR2Rdi/mEk6SaSozy0+TmOofizkcGTZTqIPPNyixkw6x4oqUhOD5A0hNwzPPzNHi7udSvw/GBWxhaXWdwuy25eDeqfNUMkW6+Hunf8E1hWNRJUIWQrsH5Q2YIKg0LN4heSdAwo0qw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1715969014; bh=O8NffGOqfbj5u5XBaU5LCpRmd0hbaZxoT3K7fYowJaa=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=apPY3YsIWia5kixvpz+BbDtd5tbv88BeVtINYQtXMxSMQh+FnVfVU2BNObDR9Z+128crn7W6bAgwzr/DevLrWIV7FccWTTRX3W+1i2UeOEY3gBDVZz8YQJgjQ/8R40ZOXoO+8If8+ymvCBOvUCJRRGLS2NBJ3i2AU7fBN5sJ1DZDBRV3SHg8PqakBdgiovZTypC0Af8P/60nkMDOfEwQqm1RL5+T9VCEG3x4zaSe2ZaGgMCwCkqNEl7NHD7r+KQtJkCstUzMlFYSbFS0El8GOhn9qWYyfETSG5s35jpjSTmO6LYiGUQ+ys4+5LIhas3DoQqXRBIaMNPm9NWk26bBRw==
X-YMail-OSG: C7dBFvcVM1nvSlNii7HUHZPruZOa8MBqqQnwNdj.jpeoRy.bsooKqqN6CofU7jF
 AL8YqbhgKh5BrdysJb4mCaBoMtviW_OVszlUtSUG0oKLtiK.exYzsRMm9DYYpvPVRu.nwayzcMxa
 84uWJP4uTL_kv9PTKZ1s.a812AFkOYGjvLUU4IhV52xweas1AptPzJ0REbAEP5WgZgUMKEJfSZyK
 F3TTo3mLHvVjoHsCqlBW4Z6hTP5L8wmhY0OuDSpYmGfdw8GjWoVIhR3sYHs.HHD2f4mvqKT1.6mR
 2fB9SoGaYaufCWqr4dk9wsrnZIBjmTxs0oyDazXsymW_8iyw9Oft.qtK_RTgFQvBVdkUi_MnjWJP
 8AVC5wdGXnG4kbyZ8_CSAyB6aH6d4QHE80kIjRXxpOZbMW8xHa0cq64Nbr7gGyR9.j4fkVVRLZcs
 7Zf1.pQ4p5BEN9uy5YxZlzZb9JA_hYBgdACt0yKhyyu7Z5RfxkLxrz.KNFGuBiyN4mUxAwIDwdP5
 iAPdb0YIuwXp2yQbeazRld2gbzZotLyq1ICxsQjq3UxkUu0uwILGk7StrenoXALkeuEo0esyt1T8
 Q8K.JrNmwZTlAE71jNUvd5Y7Cwi6wHG0bQDT5QZz.PeCqeG1aQUpYJnu0t549jFa05e3got8_B_E
 wtxLYHLutEmGYYXfcCWRopzQgbirFf0XVQ8vh.NiR46Ggo.lq2fviMCrSyxsLj2aNa6XyzEoWaMw
 HifUO2MOiQDi8pFXDUmN..rfWf9d47G2R50Xzorexpbf8bXy0XY1wB7O8DLprNBARiOKsO6.A5_O
 YIVzmby4uix8812HeZc.YG9dFXsmq7P7eX33gTpaCwX7OLAqQ8Rlw7xbL8VNspsCOQv2Uk7Gc6p3
 12uRD0w5e5EMYiHMES76sGjqnZPkNn_Vc8ndMJYOdzx6aHSaemFtrWe4.nzwWZ9L.dnGDyRbXsZI
 vZxUVNCOQnF3qAcvVq1.nEL_b6eaW65KATQkW4GQ6t2J4NO7mFixnVRh0w.Fh.8vZiLagUNaJTqz
 QVARDPvGlekmwCVhHDEkX5ytWFOQiJ6N0ItESgkPylM2h3YrIvlYtV0rlbGGa0S_.oRXMPRS2Rr9
 Fnsneaar9MxjrrahilxhtAX9nPB0wnvQPiOy__hz8XoX1mZ.8aqHIqplyMzqZPwQEM_zgzp_YamZ
 YXhZ1WWNFPW.Q_qFhSWTj0AELMIXtopd0gpk_oDz3jCnjpMHYzTVHT_V_dguwuoEswZFTzfMzjcj
 Fcg_Bn2v34qDNVCbz1I9zo14svkrDxB2DM38jZbFl1AJleAeulpBnFypKlaNR_bRzpEHwz6bwdmq
 CRvX3kouezgM5_UBFEFCiku8qCIruPUjzlXixde_bZUsS1DygFnc7rl7I2CSXK8.1iD4aYEjtieq
 WHchfHDOPE4xl1V57emQyQtMifa_zh5YbxPe7CEg9djhT6EKtWN6FnNBhl6KOPpjEy1xLaW5097W
 wqhBLRA3mQehTBP_N5HZIKCw_MmWChwwGGSAu0x5tUuB1WaNkPBA..gjkb_YsSLdEh66vtIdohJl
 F88kBpQ_ApaIwcGLs2746VxCHy1PFyqpu4tsZ2kMT4c9zogKaj5yiW5vekRNhSj9HaAQoR23JgEg
 ertRf13zJsneAph2CkqKEw2n28vhn3hqC_hkpXA5_nsXSIwdaAoykUcgxN.S.Mf0v6.CYQlkq1mh
 qxvvIk5pRZ2oQW_ppDrbYtk_fxjbdxjc10ZZ8X9Kf9ljq6uLTo8lCS8MVlltVV6dfOq_.mX4Cj9V
 wKGQtCucyyV6Oo44sD194MDzeot23oJ6aXqjvb9FdouIDF7acea8atdmlua21fPZ3UJ799xwjfvm
 Drsuukqbvp5Wak0N7epSJK_5fxu1VO38qglUK0LYxmKjDscuJbnYkticBqsDt7Zp6xt53Slewtuh
 1Q7uZQYD4qKe5lyFBl40Fi1AtErRwkx.Wt.B8LdcS.y2RJo26gGghATmbSQ5dM6MggFPPHOorRsa
 ktUTGesdXhUe_i9C6gbe6ykKqMV0nu9yWBgImM7t13zhqGifcmkBFj4MrH8m5MZeouHhJx5qH8aS
 YJ8Ntzi8MbEYXSEYhmX2dQ_xJxc.naYxUVCQPW4zDKkOD7aKg7.PGM7voSR4k3oQPhHoluFwLXR7
 6ZrS50QFr6Y_2ZkxSbfJZ29X8xQUzPEHoX9STDWOLEf_mJOOOVbbKjk2pQAOBUwS0SXcqi6tEuMQ
 kCwJUstfbt94VqML5Vg.RrNI5rTuk5.3BZsfl2VEEvGxAc_VRJnqeLKOyFERetBj1D54Q2B8yNDg
 dqoXhAm8elfHwXw--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 85153b7f-4c11-4fca-84a2-cca4d0413b58
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Fri, 17 May 2024 18:03:34 +0000
Received: by hermes--production-gq1-59c575df44-f4snh (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8b429e65f2d60a3193676eb029935f6a;
          Fri, 17 May 2024 17:53:25 +0000 (UTC)
Message-ID: <df3c9e5c-b0e7-4502-8c36-c5cb775152c0@schaufler-ca.com>
Date: Fri, 17 May 2024 10:53:24 -0700
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Introduce user namespace capabilities
To: Jonathan Calmels <jcalmels@3xx0.net>, Jarkko Sakkinen <jarkko@kernel.org>
Cc: brauner@kernel.org, ebiederm@xmission.com,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>,
 Joel Granados <j.granados@samsung.com>, Serge Hallyn <serge@hallyn.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, containers@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20240516092213.6799-1-jcalmels@3xx0.net>
 <2804dd75-50fd-481c-8867-bc6cea7ab986@schaufler-ca.com>
 <D1BBFWKGIA94.JP53QNURY3J4@kernel.org>
 <D1BBI1LX2FMW.3MTQAHW0MA1IH@kernel.org>
 <D1BC3VWXKTNC.2DB9JIIDOFIOQ@kernel.org>
 <jvy3npdptyro3m2q2junvnokbq2fjlffljxeqitd55ff37cydc@b7mwtquys6im>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <jvy3npdptyro3m2q2junvnokbq2fjlffljxeqitd55ff37cydc@b7mwtquys6im>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22356 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 5/17/2024 4:42 AM, Jonathan Calmels wrote:
>>>> On Thu May 16, 2024 at 10:07 PM EEST, Casey Schaufler wrote:
>>>>> I suggest that adding a capability set for user namespaces is a bad idea:
>>>>> 	- It is in no way obvious what problem it solves
>>>>> 	- It is not obvious how it solves any problem
>>>>> 	- The capability mechanism has not been popular, and relying on a
>>>>> 	  community (e.g. container developers) to embrace it based on this
>>>>> 	  enhancement is a recipe for failure
>>>>> 	- Capabilities are already more complicated than modern developers
>>>>> 	  want to deal with. Adding another, special purpose set, is going
>>>>> 	  to make them even more difficult to use.
> Sorry if the commit wasn't clear enough.

While, as others have pointed out, the commit description left
much to be desired, that isn't the biggest problem with the change
you're proposing.

>  Basically:
>
> - Today user namespaces grant full capabilities.

Of course they do. I have been following the use of capabilities
in Linux since before they were implemented. The uptake has been
disappointing in all use cases.

>   This behavior is often abused to attack various kernel subsystems.

Yes. The problems of a single, all powerful root privilege scheme are
well documented.

>   Only option

Hardly.

>  is to disable them altogether which breaks a lot of
>   userspace stuff.

Updating userspace components to behave properly in a capabilities
environment has never been a popular activity, but is the right way
to address this issue. And before you start on the "no one can do that,
it's too hard", I'll point out that multiple UNIX systems supported
rootless, all capabilities based systems back in the day. 

>   This goes against the least privilege principle.

If you're going to run userspace that *requires* privilege, you have
to have a way to *allow* privilege. If the userspace insists on a root
based privilege model, you're stuck supporting it. Regardless of your
principles.

>
> - It adds a new capability set.

Which is a really, really bad idea. The equation for calculating effective
privilege is already more complicated than userspace developers are generally
willing to put up with.

>   This set dictates what capabilities are granted in namespaces (instead
>   of always getting full caps).

I would not expect container developers to be eager to learn how to use
this facility.

>   This brings namespaces in line with the rest of the system, user
>   namespaces are no more "special".

I'm sorry, but this makes no sense to me whatsoever. You want to introduce
a capability set explicitly for namespaces in order to make them less
special? Maybe I'm just old and cranky.

>   They now work the same way as say a transition to root does with
>   inheritable caps.

That needs some explanation.

>
> - This isn't intended to be used by end users per se (although they could).
>   This would be used at the same places where existing capabalities are
>   used today (e.g. init system, pam, container runtime, browser
>   sandbox), or by system administrators.

I understand that. It is for containers. Containers are not kernel entities.

>
> To give you some ideas of things you could do:
>
> # E.g. prevent alice from getting CAP_NET_ADMIN in user namespaces under SSH
> echo "auth optional pam_cap.so" >> /etc/pam.d/sshd
> echo "!cap_net_admin alice" >> /etc/security/capability.conf.
>
> # E.g. prevent any Docker container from ever getting CAP_DAC_OVERRIDE
> systemd-run -p CapabilityBoundingSet=~CAP_DAC_OVERRIDE \
>             -p SecureBits=userns-strict-caps \
>             /usr/bin/dockerd
>
> # E.g. kernel could be vulnerable to CAP_SYS_RAWIO exploits
> # Prevent users from ever gaining it
> sysctl -w cap_bound_userns_mask=0x1fffffdffff

