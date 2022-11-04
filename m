Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887C561A012
	for <lists+keyrings@lfdr.de>; Fri,  4 Nov 2022 19:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiKDSfc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 4 Nov 2022 14:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiKDSfb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 4 Nov 2022 14:35:31 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8854AF10
        for <keyrings@vger.kernel.org>; Fri,  4 Nov 2022 11:35:29 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l6so5269678pjj.0
        for <keyrings@vger.kernel.org>; Fri, 04 Nov 2022 11:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VI9dLZqr4phcLu/et/iVRa9n3ErWpwIc+07/b50LvBM=;
        b=eSmCdWYUo+MFol9rpoHIO4A3jWbVg5gjgrxdtvSvXcxpFOvgpn9xN9wC+fN6yyl1vV
         ppeLBE/m++6rQfxfGFY1nnD319PbUjzI6Wz6hFJdD+qIqtWg5GNX5WtM/tNVzdJqRF/a
         bVPGV4ssXA6he9ggcTxi1eOvdJjniUyQ3m9xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI9dLZqr4phcLu/et/iVRa9n3ErWpwIc+07/b50LvBM=;
        b=mVl6w7NKnenGzrhjUKB93v5tpQtgmF5/R+sLJgbJBFzWNPBU1FXllBSiVDuNL8PxVJ
         039IlFL9Ze7yFAK8DfNuGxlyZgsM+G2QT30KM9Z/wILmLAnsxsuC4WUDDwfQFt3Ao66U
         EDl9jUZD+hyoAl8Y3WPusqKP2+Q6DXXeTlROYDAPkXciZOVPvxq1KA7w1qQ/oKxA7UVJ
         qrk9sTnIh5TrxNkNHpA+7zEaqOkvytKqcg8leUuwixHfsA+C4NpvDxIVKw/dJkSP83zg
         VY1P5p1GKPnnnXklZF2Iz1XWcCGoCRUCLIHi2V9bdbq/KLI0YnnnbBXiP4/cJHB7ozAj
         vwXQ==
X-Gm-Message-State: ACrzQf2lm/+wzP69BGI8Z0Jl7CpUk1DJPFHT/dc6pZmMgMyMnLtCKhXQ
        wMGXG+vil4Mv87gu8wTV1XrIgA==
X-Google-Smtp-Source: AMsMyM6fb+TEh9BarhrBk28d3mb/yd1nmOCqWa0q+90fvf1SgZpDv75w3DFTiADbQBgXSzOJalHd2A==
X-Received: by 2002:a17:90b:3b4a:b0:213:589d:d300 with SMTP id ot10-20020a17090b3b4a00b00213589dd300mr37724237pjb.139.1667586929205;
        Fri, 04 Nov 2022 11:35:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001868bf6a7b8sm81457plb.146.2022.11.04.11.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:35:28 -0700 (PDT)
Date:   Fri, 4 Nov 2022 11:35:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-pm@vger.kernel.org, rjw@rjwysocki.net, gwendal@chromium.org,
        apronin@chromium.org, Pavel Machek <pavel@ucw.cz>,
        Matthew Garrett <mgarrett@aurora.tech>,
        linux-integrity@vger.kernel.org, jejb@linux.ibm.com,
        zohar@linux.ibm.com, dlunev@google.com,
        Eric Biggers <ebiggers@kernel.org>,
        Ben Boeckel <me@benboeckel.net>, jarkko@kernel.org,
        Matthew Garrett <mjg59@google.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        Paul Moore <paul@paul-moore.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4 06/11] security: keys: trusted: Verify creation data
Message-ID: <202211041135.0B18C14@keescook>
References: <20221103180120.752659-1-evgreen@chromium.org>
 <20221103105558.v4.6.I6cdb522cb5ea28fcd1e35b4cd92cbd067f99269a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103105558.v4.6.I6cdb522cb5ea28fcd1e35b4cd92cbd067f99269a@changeid>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Nov 03, 2022 at 11:01:14AM -0700, Evan Green wrote:
> If a loaded key contains creation data, ask the TPM to verify that
> creation data. This allows users like encrypted hibernate to know that
> the loaded and parsed creation data has not been tampered with.
> 
> Suggested-by: Matthew Garrett <mjg59@google.com>
> Signed-off-by: Evan Green <evgreen@chromium.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
