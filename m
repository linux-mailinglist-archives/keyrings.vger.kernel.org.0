Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE43256ECC
	for <lists+keyrings@lfdr.de>; Sun, 30 Aug 2020 16:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgH3O5C (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 30 Aug 2020 10:57:02 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:36148 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgH3O47 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 30 Aug 2020 10:56:59 -0400
Received: by mail-ej1-f68.google.com with SMTP id l2so5222933eji.3;
        Sun, 30 Aug 2020 07:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FmfbpA0t89Y3GN3q2a0BqnJH3Vsp3rUS9TSaNl4DebE=;
        b=JJm0akM5QkYFhx6hL/bNTmqVZknsCl0I6JUmjihTNTu/LgluKGV6Gw3qLirOWD6qCQ
         3P/EzaUnjlYUqAJxjgXfdJpU4dmQqPlfgFq5sDszjd/IbHMf1BK5z4AJnDuqu2u7M7Ej
         q2Fw2Z5KgfY8OWvtTLBwfGte2q7uhXJuLiEy01YfDh5q0xTFhS1weLZRtVrD3kwKilYw
         4QVePB/Kc2NpPDFToOMF0l7vMDGIXQrSno5hCmEpTpXptV3Lb3WZbrFebUeAVaIeKrkZ
         s+crxy1o5S2svF1Lh77dqRtdJgTB8r9Mkuoic/c1/5BLn+RGcOd5fsvOirxfK/5Eouqb
         K3VQ==
X-Gm-Message-State: AOAM532SiIeUpO7B51d1lf8MRVhV2QtO5Bg4j7ZK5eYMbBryZYLwMAPO
        L2Gi3QOuJyyKpmAnwo7SoCiM5jCGf9w=
X-Google-Smtp-Source: ABdhPJz1TROFuryXhQ5bxBd9DP2kpjRz3z/1fdQtws9ck3EeSWBtSP/Z/YV/cGDVPZgbrESkwFClQQ==
X-Received: by 2002:a17:906:f84b:: with SMTP id ks11mr7582022ejb.264.1598799417607;
        Sun, 30 Aug 2020 07:56:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id v10sm5001715edi.69.2020.08.30.07.56.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 07:56:57 -0700 (PDT)
Date:   Sun, 30 Aug 2020 16:56:55 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] KEYS: asymmetric: Fix kerneldoc
Message-ID: <20200830145655.GA31461@kozik-lap>
References: <20200819175212.20583-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819175212.20583-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Aug 19, 2020 at 07:52:12PM +0200, Krzysztof Kozlowski wrote:
> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_1' description in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_2' description in 'asymmetric_key_id_same'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  crypto/asymmetric_keys/asymmetric_type.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Hi David, Herbert,

Any comments here?

Best regards,
Krzysztof

