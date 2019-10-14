Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3E8D635C
	for <lists+keyrings@lfdr.de>; Mon, 14 Oct 2019 15:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfJNNGK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Oct 2019 09:06:10 -0400
Received: from mout.gmx.net ([212.227.15.15]:37933 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730064AbfJNNGK (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 14 Oct 2019 09:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1571058365;
        bh=Xl/qPBC+Pfud9Ygr6K1pr5rV2FyfKpYFOUPFsLFFUKA=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=aSXArlodqEbH0ybChyBiDqxmFLqdiXJL6HdT3QAzAFE9qEq4vuNbludpEW816+nIb
         pwsUW0Bg4nTShNHyiZpefEiRbcnOs8gHSScUFhSJ7Gj192+XjMz60KTYlvAHlZ7rdf
         ow8+buLi1CRxiMdRVKvigNsz3GbeYMpi+nDg7b5w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([91.61.58.244]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1iKHAC2ZZB-000N5M; Mon, 14
 Oct 2019 15:06:05 +0200
Date:   Mon, 14 Oct 2019 15:06:05 +0200
From:   Marcus =?utf-8?B?SMO8d2U=?= <suse-tux@gmx.de>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, suse-tux@gmx.de
Subject: Re: [PATCH] keys: Do not check the retval of commit_creds in
 join_session_keyring
Message-ID: <20191014130604.u65ohezf6usjkico@linux>
References: <044b34c4388405e995e38fb57fc120361bf962db.1568124150.git.suse-tux@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <044b34c4388405e995e38fb57fc120361bf962db.1568124150.git.suse-tux@gmx.de>
User-Agent: NeoMutt/20180716
X-Provags-ID: V03:K1:WPE9WEvPmqv9FNoYHvwJmOqL5+krgDbiI01lazynpTOOSd8ugDr
 zz/t0Pgz1bxPCJRtNGZxIRIXeZERkdmjja2aYMQ8JJq/BEDLXlMXDPb/08PN+2RYIqn0ozq
 DwbgEAnhexxPnpwnDqdYtd+OZdsYyWYLYbX/6WWi3dhleow/RrX5VstDW5RDVamWkBHu7d9
 5jNmsLirHQ+35jRARNyFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r6j9VWgmlGE=:l4MgM1OX7tMXcoZf8n2vrc
 W3qPDfRO0R94z+iCsvBxF/q6Oy/X1dG3rFoNRHo7nh3QxVBT81AmYQE2jU3BKZf35MB36hk3l
 Y4Mg0V9A0Upf7kIjQJAc1ZvLO1kWiz53AqSKuPnC3XOkxL7yrXjOmO3kMQ3yKsViZJ3+7BNbn
 bq71LpJPIVaOqGyNIjNNLD+rQG1rXuawX0sn+bEQV334kl/2KVLOqNv3CsgeMMcSwzckXC2uh
 2VdaczuzC+jYKEIcjDrIsp7ltACSD+6rOoQtKm5WFHZ2si0DrZWy9YWtW1q/FHvUKjLSePTMn
 MxLxdQ2t0C3j9NwJsXmS+qfU2DqC4ZX7sbta8egevzIaSTcum7V+7VNU1/DoVjmRwgB9Yro/J
 UhDeAItzPixhBC/WrJ+d80rnTfJQSUqIOskFBaVDSEy1Xtq04xrgnNYH3xus0vsADu3vdpIpr
 QhZDMv5cofqcoS2ir/fUuVs0hVrId7vAAlKIxijDs9eAIaYZTdMgMSUAbQ6EZittmHAuqpiG+
 4tyEQC7m865yktxzbNy5sSD2KAhvYjr6CTxE58yttAcSMtndfy9wAshU+jUlLB5uuLMZblDGG
 YKA1YtKGtoKR2+eoD4dKDp2t7AGC1S9zMaRIXFMTw6GYsp3MH6223yzIw9h8eKILiM1OU0g05
 OLs4aDyet1gGPeQZbPVGEqkSIgUbLa3wn7UaFEuUb/HxrcMGeV3TdP13NHVArEaAhXp30+nio
 ABdR3EwnMYq04CMJECeccBq115REuQxdP26TmME/IgW1l1i8De21HjH59F/k8gl+6bX4e9OQ6
 9DCXvl3KLaF4WWWLhAKaH//7jmZqPDouSokp7+ichhknSpOqOXZT1E7SN5STb7WOauTyuaOI+
 8W6apWvqK04Kg/Bo9GfAe+mVn6iZOvqOr/oib8wEePU1x52oShyCWXZFzLb03QI+/GylXYN0C
 gRyu9Kjl6Lz77W1/2tRaJYsmY/fFSTdSvklCXwTCj9zxAipnPgJVmBJj/mUmejwlyaXBRKBCO
 +IGxr2jRyaEk3W2aUwtFD2E+gbx1XD3fYKo88mCWOGeV6b63inyk7aCs9j+TmEa+CX5D5rc8g
 EgS0S/e5wgh7/MKAtzkodwKRAFrAcgQFXrmgDaSSqMveIu0p1nBesbwxS07YjEiw1/WMPcUwe
 D2YTyKMo956KLixcRW5tqdDjQBhfv4Vfaad9kNHWdGOdh8/37efWeU5igkyHCIpbw4AengeGt
 jKY4iOmEXZ8MugP7xI7+uK9sy+hrfITEpIlVFnA==
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Just a gentle ping - any news on this?:)

On 2019-09-10 16:07:59 +0200, Marcus Huewe wrote:
> Do not check the return value of the commit_creds call in
> join_session_keyring in order to make the code more concise.
> Since commit_creds always returns 0, the if-statement is not needed
> and the session keyring's serial can be directly assigned to the
> "ret" variable.
>
> Signed-off-by: Marcus Huewe <suse-tux@gmx.de>
> ---
>  security/keys/process_keys.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
> index 09541de31f2f..e7cd1ff84709 100644
> --- a/security/keys/process_keys.c
> +++ b/security/keys/process_keys.c
> @@ -840,7 +840,7 @@ long join_session_keyring(const char *name)
>  	const struct cred *old;
>  	struct cred *new;
>  	struct key *keyring;
> -	long ret, serial;
> +	long ret;
>
>  	new =3D prepare_creds();
>  	if (!new)
> @@ -853,10 +853,8 @@ long join_session_keyring(const char *name)
>  		if (ret < 0)
>  			goto error;
>
> -		serial =3D new->session_keyring->serial;
> -		ret =3D commit_creds(new);
> -		if (ret =3D=3D 0)
> -			ret =3D serial;
> +		ret =3D new->session_keyring->serial;
> +		commit_creds(new);
>  		goto okay;
>  	}
>
> --
> 2.22.0
>
