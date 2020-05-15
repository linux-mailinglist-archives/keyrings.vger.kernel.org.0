Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D9E1D59B3
	for <lists+keyrings@lfdr.de>; Fri, 15 May 2020 21:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEOTKa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 15:10:30 -0400
Received: from sonic309-27.consmr.mail.ne1.yahoo.com ([66.163.184.153]:38267
        "EHLO sonic309-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgEOTK3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 15:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589569828; bh=WPsHLe9g5yHs563Uuj+CpTBWcNmODYTyuyUfmE44vqo=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=VqdlBCKXlvcb6xUcWJSFqf3FFWpN4NUWuwnJl4pWDsaSAKlnMdpzPM+C/2DtZuqByMpjqBzkuUg1zwdaKmLffOiretaPppeB8lxsaCjY44tkIkDrmKLVbGzFLfZl8e+b3euLFz464L6jsiAN9fUhk/Vn/xOWE5GIyS9ppHnFIpjNnmIhXyEpUY3Yq4+8aiY2YqjyRX6LnWEZrjWIXvBm53kXyRfNSGfOiZj+WIL9mmw8wUTmSQe8fbuY7tAtZ8ZjVTe3WMG3Tc/BqqwSuOTjnYPAfAnEVsWnGt1B1G7bJWe/KMV0NsxIPcxHgB8TXyM2DVxGPbeUM0jSVKjz6NMjvw==
X-YMail-OSG: Ywx85RgVM1lIzTeEuoPABPfKk3YhXfCGhBMkSBuN3H_t9anvp2uuaaDjMyJ2Vxn
 aYJSYaqOJyJv6j2icPGVcH8z.6.d6NhOztTFl4f5.2WSZgUufHXhlVDpyBRfr2hPFqLlpBNSgCaw
 ZJNARGa_jtcI3BGxI.nyPV5yMUuUFijwbh0RT_tDi7c4sQk3qAs4weSkNDCbNCcF9vemjHdm1i_g
 L68uKp1mzurjVw1jviH22m_JYgT0HHGQeV0dhRoT6EZMRvSErERGm.5XBMYylSUzBC1f_hPL7sOy
 8MQVsdazxZkfiAYDk2ju7EPK2XMZ7N3NWUn0t4vLwdQ7V0r7pG8g.tzU6kwbfPKHLwULA2MH_5p9
 OAer8aC91HU5OSwCK1yZ0eoggu.fo6s6U9ZFjOjuTJEpIDztn..qjVFUVSG4J8hPtHU64L_0uS8m
 piQ0Ady6caKsDPZV2xgf64alIeUuBVV8cnUJXpeeZqXRlSJfzHlW.yGLKLbtrMRtGcqpBTlWOEqG
 8eXM9dktUMWfJdhUHrBGIsJexukxiQT4NaK9XNVIPWTBs1jzQ0G2Ko2xGO.2inKwn6JR7L4ITaNy
 GN8R5yGinr339vwZwq2yJe6rTifm9sJqqa1VVIFauuBtSibq0a4.1j6dDS44Tr8LrDNWN2uJZltF
 SMQf7B7MLqPQDnxOt_4q9cZI8OJ1Mzxb7qM2XDHVy5v74kCE.qkE2rzYCFoQVCWGqlYESySeaxSq
 15xHZpnd2VrwG88VwMclS5n7HWSW9IySrZJLr01zqbr1e2AXv9OLzIcHZtERsJIMs_ydISba.iMl
 MqVY.YN9_fcqSX5aJOTVuL3FKiol2wrMYdVYM6ogk_8DIFmZjw.X7Dc6t9nMAnO_y2AX0SBx1UKl
 .W6X23MSFhjPdJedmqU3NDWZotsV6GcepeCj10ZVhMx5yaekigv5Zwv4VMkQFooS5CEZdTjnlv6j
 dLpjBidhPSaHj8oT6ii8fKc_jFj0n2lx.yb0KqnXbsUWUb4njII8fb1eC1mlJpBv1ciTQgJDAvDR
 mncYuGaZqZQsfvvUt6ZghM.LU9KfTBhXPmg5VeHXELW44dwvJcMRg76IHtRWd3WTgrth1nWJJHxK
 ZdU8GWwUfSPuqnZTjfBtksnCWpeuMdyxHmloCPDGtTUKm9Y0fFJXgg.2dpQq4EEpCp_4Rs.252eB
 KusnFB0tqgFFjiXupmkaLPR0McDswWIK_6JG2MmZQ_Mm4yD0K3TSRh1cxKZLZCAWc4xFjorhuW6k
 EMHtZ7wNvYJ1LiHBo1VGWp.R1KEN0BZRhrCFdSIMZS.b9is3Bd52WMOHx2k54qf9P8P.QhmXcLGj
 hutvrNMsA9AEPrAQOuWAmk2MamZWCQPdSNPQ4HdiINQaQ80pBLYAOTkNzV7XVnoK0VwpuEciWHXy
 IBN3IZZT74vs6hFbkk3XMr_psxr2h
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Fri, 15 May 2020 19:10:28 +0000
Received: by smtp421.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 066eda7e6dd4a51cab867d14eaeb9270;
          Fri, 15 May 2020 19:10:24 +0000 (UTC)
Subject: Re: [PATCH] keys: Move permissions checking decisions into the
 checking code
To:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
 <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com>
 <3999877.1589475539@warthog.procyon.org.uk>
 <CAEjxPJ5wW2qHYDsqKr5rjnRJ++4f2LXobCQkKZvWCSb_j0WN6w@mail.gmail.com>
 <196730.1589561109@warthog.procyon.org.uk>
 <CAEjxPJ6JGZxF_G63Y7M-CQpmt5Sqp2uFF4oEKS6NpNLZxXhXcA@mail.gmail.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <1ca402a1-5665-44b8-ef94-9473ebd6a32a@schaufler-ca.com>
Date:   Fri, 15 May 2020 12:10:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ6JGZxF_G63Y7M-CQpmt5Sqp2uFF4oEKS6NpNLZxXhXcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.15941 hermes_yahoo Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 5/15/2020 11:55 AM, Stephen Smalley wrote:
> On Fri, May 15, 2020 at 12:45 PM David Howells <dhowells@redhat.com> wrote:
>> I can go back to the enum patch for the moment if you and Casey can put up
>> with that for the moment?
> Yes, let's do that.

OK by me.

