Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1086E133575
	for <lists+keyrings@lfdr.de>; Tue,  7 Jan 2020 23:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgAGWGd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Jan 2020 17:06:33 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:38017 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgAGWGd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Jan 2020 17:06:33 -0500
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N6JtR-1jmL2U1O2b-016eOK; Tue, 07 Jan 2020 23:06:31 +0100
Received: by mail-qk1-f175.google.com with SMTP id a203so909099qkc.3;
        Tue, 07 Jan 2020 14:06:30 -0800 (PST)
X-Gm-Message-State: APjAAAVb410bR7aDf9atZ3/Y8cBO3H+sfO9Bh0A4fyBS5QhJSXFXDzlZ
        FPEEQm+iejWCv/j45urnGEYwjVXrR+vlMsGCN0k=
X-Google-Smtp-Source: APXvYqzLX1vDB9bbHKm0RIfLRmhhg3Pbbkya5hKGBWX/IIiUDGpl/J0vvUx4sgrkexjEB1wHob2sa45CjmKbtRESa5M=
X-Received: by 2002:a05:620a:a5b:: with SMTP id j27mr1531468qka.286.1578434790062;
 Tue, 07 Jan 2020 14:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20200107203041.843060-1-arnd@arndb.de> <1578430874.4288.2.camel@HansenPartnership.com>
In-Reply-To: <1578430874.4288.2.camel@HansenPartnership.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 7 Jan 2020 23:06:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2GbfvgWep1JGNUX7c8jrtQs40PgUfq5C3d_zYuBK5nmw@mail.gmail.com>
Message-ID: <CAK8P3a2GbfvgWep1JGNUX7c8jrtQs40PgUfq5C3d_zYuBK5nmw@mail.gmail.com>
Subject: Re: [PATCH] ima: make ASYMMETRIC_PUBLIC_KEY_SUBTYPE 'bool'
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.ibm.com>, keyrings@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UNCZ4qhZHs2qnSxwdJ7LsP8e+/8oh0SxkGihIdlHUQ6cnEU0nWQ
 SyKEWjbvZgrzpN/ioEEhPBuxLgOJYfm9CUzbt+KRkgFUMEUMUrad6Tw1ZYApxcWIFKoVcVT
 hGrpnLs9xXVsvbf542th7RIzwOBE/3Q7oGaSaAOgUCLS0m/J6V2uiuqMKGaEFThLnq16vLX
 uYcE4Po9nPm2Ow5JoK0pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kVSAH9wvaGI=:l20eCZV1dCjDqukeUw4Gzf
 HbALFQ+QUIxaAJT+c0fcRA7BLMFyZ1aWywgnu3XkV56rUxEml7oiWA4D1ogEbfVNLmV90YSUl
 W5iyI+h4E1TWyI4QlHxXl4vh10xEbXTFJaOw8Rxog6QGZHsBfewji1/px19BNqGh+yuUkX6CC
 WA7DQfWn7NVZh7undBoYTURzu5PBcK4Be5wmq4e1DvJf9bEpZ+cEGxPrFOIRWxMblKfQDbran
 Rzjybl9QmOokfiin3/Vi1gRPOulOU+BTt+H+GFizvB2df7WfmTyEP7/Gmt7BlFDED1Jh+O2XF
 ESD+ZUKqb22euLMYHoBIc2tcGRNwPdVjqMdp8jlYrzyjQNOdFI/h9o/jPd0XIbTNbYjK/Wmbc
 SxCleVE0xNwUU0uI5zlb475gv+4W3L4x8MS1VwnQkl9SZxw1If+p8+JrS/cpsMDpUBdN5DYP7
 SOwaFIBuQWxEtKKfOyeV1WvCKwMTruAgh4LNA86QcpcGZDOnK8jLOGBXj3YKEttnBZpE/Fnqd
 HtIpxse/e7hn96fWRtZm9bm8A+Q6C7baP9dNReMuXYHSJpMgspOXMoBvN6yDHSjcJgJHDm/B3
 YMXGHprDt+IqvQbOrpVttEkFpjVa3aVtsO+B6zyrfhIXtZo/rl4v2J2TakXMtOmdtVLPEmgPt
 OAEKOBL5YQKtBn8xn2zpxajrvo9o8LKU9hYqg9sv2IGbMD1iWW9t/Umu9v6N8DKx6xqsUWxyZ
 bmQ6c8jdIP0mZrrzXpA94t3J394bo1idNG5E3bPhrQ3QNZ7R8M+0WQWxZfsDeLEpNF5+pn1Hd
 IRv43Ru+8jhRIfyt4E4jECocSjcVNs4ULLQn0UnHnMzPf2qiVLNAriWU2TQcynDF1RQUQ1P1P
 u9/T50iWs5OuNU0pnQyg==
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 7, 2020 at 10:01 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2020-01-07 at 21:30 +0100, Arnd Bergmann wrote:

> >  config ASYMMETRIC_PUBLIC_KEY_SUBTYPE
> > -     tristate "Asymmetric public-key crypto algorithm subtype"
> > +     bool "Asymmetric public-key crypto algorithm subtype"
>
> I believe the crypto guys do like stuff to be modular.
>
> However, we've already implemented this solution:
>
> https://lore.kernel.org/linux-integrity/20200107194350.3782-2-nramas@linux.microsoft.com/
>
> To solve the problem via an intermediate boolean config variable.

Ok, that looks good to me.

    Arnd
