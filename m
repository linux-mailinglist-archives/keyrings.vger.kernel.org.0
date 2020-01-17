Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48289140976
	for <lists+keyrings@lfdr.de>; Fri, 17 Jan 2020 13:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgAQMHX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Jan 2020 07:07:23 -0500
Received: from mickerik.phytec.de ([195.145.39.210]:53562 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgAQMHX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Jan 2020 07:07:23 -0500
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Jan 2020 07:07:23 EST
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1579261941; x=1581853941;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gqK1xeGxQeyBtOyx9mXijyzCeAtztf2bF1PPlgdG9zk=;
        b=KRc4TH8YJADFqJNSNGnBkkLooNJlNc7jaao3jAE0XAGo0jpITYfLjRJ5t76Zxub9
        1W9RW/QNO7J1gI/ob5TmWmJdGMrzWke0Zy6E8tB7YWQJqrWbwFJt26uoVMRc73WF
        iYxd/yx7haB8GpvlcvtUUYcEbJtdW9WjLc2ynrCvQoo=;
X-AuditID: c39127d2-c07ff70000002a58-65-5e219ff51aef
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id CA.8F.10840.5FF912E5; Fri, 17 Jan 2020 12:52:21 +0100 (CET)
Received: from [172.16.20.241] ([172.16.20.241])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020011712522129-160139 ;
          Fri, 17 Jan 2020 12:52:21 +0100 
Subject: Re: [RFC PATCH 2/2] dm-crypt: Use any key type which is registered
To:     Franck LENORMAND <franck.lenormand@nxp.com>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Cc:     horia.geanta@nxp.com, silvano.dininno@nxp.com, agk@redhat.com,
        snitzer@redhat.com, dm-devel@redhat.com, dhowells@redhat.com,
        jmorris@namei.org, serge@hallyn.com
References: <1551456599-10603-1-git-send-email-franck.lenormand@nxp.com>
 <1551456599-10603-3-git-send-email-franck.lenormand@nxp.com>
From:   Maik Otto <m.otto@phytec.de>
Message-ID: <97ab8779-1351-0030-7a9f-fababe1f57c2@phytec.de>
Date:   Fri, 17 Jan 2020 12:52:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1551456599-10603-3-git-send-email-franck.lenormand@nxp.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 17.01.2020 12:52:21,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 17.01.2020 12:52:21
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWyRoCBS/frfMU4g6+bRCzWnzrGbPGu6TeL
        xd53s1ktmla/Z7b4cP4wk8W69YuZLLbeaWKz+NDziM3i/IVz7BZLF19jtmjb+JXRgdvj2u5I
        j57vyR4b3+1g8ni/7yqbx+dNcgGsUVw2Kak5mWWpRfp2CVwZDeefsxf8V6noaJRrYDwh28XI
        ySEhYCKx/vY61i5GLg4hga2MEp/3X2KCcM4wSmz584wRpEpYwFvizJ0rzCC2iECBxK+73xlB
        ipgFljBKrP41lQWio51R4tGdBWBVbAJKEg/nrgazeQVsJCZcmMYCYrMIqEo8fvgSLC4qkCjx
        ruEtVI2gxMmZT8BqOAU8JWb3LwS7SULgCqPEynWrWSGOFZI4vfgsWAOzgJnEvM0PoWxtiWUL
        XzNPYBSchWTWLCRls5CULWBkXsUolJuZnJ1alJmtV5BRWZKarJeSuokRGCGHJ6pf2sHYN8fj
        ECMTB+MhRgkOZiUR3ru9inFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeTfwloQJCaQnlqRmp6YW
        pBbBZJk4OKUaGGd/nhn4d8b7bTFHrCNKYt40Fyned/N8W3Gn4FGbnObk0I2Huc/Lal6VMIvX
        qWd56WV9xt5a3OGUlP7cuOgMs7c27Nmib2Iqmv9YF3zTWi80M614R3ZNZblSWAPTMo8Jr1ad
        FHz9QNZnf/7K4F+POycv/CbItuvhymNS89f/ONbfJsV1Ovu7phJLcUaioRZzUXEiAH2Okfl+
        AgAA
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi

little bug fix, because this version chrashed with access violation
on an i.MX6Quad with a Mainline Kernel 4.19.88

> There was only 2 key=5Ftype supported by dm-crypt which limits other
> implementations.
>
> This patch allows to use any key=5Ftype which is registered obtaining
> the key=5Ftype from key framework.
>
> This also remove the compilation dependency between dm-crypt and
> key implementations.
>
> Signed-off-by: Franck LENORMAND <franck.lenormand@nxp.com>
> ---
>   drivers/md/dm-crypt.c    | 11 ++++++-----
>   include/linux/key-type.h |  2 ++
>   security/keys/key.c      | 42 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 50 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index dd538e6..e25efc2 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -35,6 +35,7 @@
>   #include <crypto/authenc.h>
>   #include <linux/rtnetlink.h> /* for struct rtattr and RTA macros only */
>   #include <keys/user-type.h>
> +#include <linux/key-type.h>
>  =20
>   #include <linux/device-mapper.h>
>  =20
> @@ -2010,6 +2011,7 @@ static int crypt=5Fset=5Fkeyring=5Fkey(struct crypt=
=5Fconfig *cc, const char *key=5Fstring
>   	int ret;
>   	struct key *key;
>   	const struct user=5Fkey=5Fpayload *ukp;
> +	struct key=5Ftype *type;
>  =20
>   	/*
>   	 * Reject key=5Fstring with whitespace. dm core currently lacks code f=
or
> @@ -2025,16 +2027,15 @@ static int crypt=5Fset=5Fkeyring=5Fkey(struct cry=
pt=5Fconfig *cc, const char *key=5Fstring
>   	if (!key=5Fdesc || key=5Fdesc =3D=3D key=5Fstring || !strlen(key=5Fdes=
c + 1))
>   		return -EINVAL;
>  =20
> -	if (strncmp(key=5Fstring, "logon:", key=5Fdesc - key=5Fstring + 1) &&
> -	    strncmp(key=5Fstring, "user:", key=5Fdesc - key=5Fstring + 1))
> -		return -EINVAL;
> +	type =3D get=5Fkey=5Ftype(key=5Fstring, key=5Fdesc - key=5Fstring);
> +	if (!type)
> +		return -ENOENT;
>  =20
>   	new=5Fkey=5Fstring =3D kstrdup(key=5Fstring, GFP=5FKERNEL);
>   	if (!new=5Fkey=5Fstring)
>   		return -ENOMEM;
>  =20
> -	key =3D request=5Fkey(key=5Fstring[0] =3D=3D 'l' ? &key=5Ftype=5Flogon =
: &key=5Ftype=5Fuser,
> -			  key=5Fdesc + 1, NULL);
> +	key =3D request=5Fkey(type, key=5Fdesc + 1, NULL);
>   	if (IS=5FERR(key)) {
>   		kzfree(new=5Fkey=5Fstring);
>   		return PTR=5FERR(key);
> diff --git a/include/linux/key-type.h b/include/linux/key-type.h
> index bc9af55..2b2167b 100644
> --- a/include/linux/key-type.h
> +++ b/include/linux/key-type.h
> @@ -176,6 +176,8 @@ extern struct key=5Ftype key=5Ftype=5Fkeyring;
>   extern int register=5Fkey=5Ftype(struct key=5Ftype *ktype);
>   extern void unregister=5Fkey=5Ftype(struct key=5Ftype *ktype);
>  =20
> +extern struct key=5Ftype *get=5Fkey=5Ftype(const char *type=5Fname, size=
=5Ft string=5Fsize);
> +
>   extern int key=5Fpayload=5Freserve(struct key *key, size=5Ft datalen);
>   extern int key=5Finstantiate=5Fand=5Flink(struct key *key,
>   				    const void *data,
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 44a80d6..ef76114 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -1156,6 +1156,48 @@ void unregister=5Fkey=5Ftype(struct key=5Ftype *kt=
ype)
>   }
>   EXPORT=5FSYMBOL(unregister=5Fkey=5Ftype);
>  =20
> +/**
> + * get=5Fkey=5Ftype - Get the type of key using its name
> + * @type=5Fname: Name of the key type to get
> + * @string=5Fsize: Size of the string to match
> + *
> + * The functions support null ended string (string=5Fsize =3D=3D 0) as w=
ell as
> + * pointer on a string matching a number of characters (string=5Fsize > =
0)
> + *
> + * Returns a pointer on the key type if successful, -ENOENT if the key t=
ype
> + * is not registered.
> + */
> +struct key=5Ftype *get=5Fkey=5Ftype(const char *type=5Fname, size=5Ft st=
ring=5Fsize)
> +{
> +	struct key=5Ftype *p;
> +	struct key=5Ftype *ktype =3D ERR=5FPTR(-ENOENT);
> +
> +	if (!type=5Fname)
> +		return ktype;
> +
> +	down=5Fwrite(&key=5Ftypes=5Fsem);

down=5Fwrite(&key=5Ftypes=5Fsem);=C2=A0 changed to down=5Fread(&key=5Ftypes=
=5Fsem);

> +
> +	/* Search the key type in the list */
> +	list=5Ffor=5Feach=5Fentry(p, &key=5Ftypes=5Flist, link) {
> +		if (string=5Fsize) {
> +			if (strncmp(p->name, type=5Fname, string=5Fsize) =3D=3D 0) {
> +				ktype =3D p;
> +				break;
> +			}
> +		} else {
> +			if (strcmp(p->name, type=5Fname) =3D=3D 0) {
> +				ktype =3D p;
> +				break;
> +			}
> +		}
> +	}
> +
> +	up=5Fread(&key=5Ftypes=5Fsem);
> +
> +	return ktype;
> +}
> +EXPORT=5FSYMBOL(get=5Fkey=5Ftype);
> +
>   /*
>    * Initialise the key management state.
>    */
>
