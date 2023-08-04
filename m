Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F69177061D
	for <lists+keyrings@lfdr.de>; Fri,  4 Aug 2023 18:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjHDQhj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 4 Aug 2023 12:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjHDQhi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 4 Aug 2023 12:37:38 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC6AB2
        for <keyrings@vger.kernel.org>; Fri,  4 Aug 2023 09:37:36 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-40c72caec5cso4531cf.0
        for <keyrings@vger.kernel.org>; Fri, 04 Aug 2023 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691167055; x=1691771855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTip6s7Loh3TOdN1yFeXhTIES4BpCWlKL7HeHYS4/E4=;
        b=3YpfqKRHnum/83XHfepMXHlWEUrgaJl2CQFZODv01ncw0wha2x2vgZTtq4sjRIH72u
         8V0Gucvrj8vGq7W4PJhg1dZBnx0TBPISMJUMImyNydgGUaGYNnDPOFT/kBz7nnWm6Z4l
         56+nFyl0TTd9k3hXHxQAfSftDvBkF2i02cTLm4zAjqJvVQntVLMAeJmtdi/nt86CefO9
         koN4JR6ZMw65YmvbZ5WuT+nr7mrxQTK87HGLlag8Vei8qGs4F0SCj48pMW46M7sHdV2X
         TLxK3juDIeG3frjL4FQaCfaRp9R4Bwi86OHitbaFNKTHq+8pWc8uMcKmJnCqG1C4lDDk
         5t4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691167055; x=1691771855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTip6s7Loh3TOdN1yFeXhTIES4BpCWlKL7HeHYS4/E4=;
        b=d7whtMq66q3b6cKR/hJ4SNNGL2mCmCSqd1ON6bFk0Q7JsogrjG4Cm/ZaWldnXxaKE8
         aLqZwAF/t0pefZD/rF1aCAIWanoWI6WkEojKwYGlXjl+/Ydg0nQ1gtkSh6W+lh582SUT
         cUpNUntvMe75AYNFn83DaRbJe2iJcS5N/6XZKv4j5XxhXHRvekef2JPJVP1NjtUPii1q
         APU4vt22ru01+t1Z/MNEtM+/PcGT2wWxVh4KzV2MW9YT3KTfyzPycZRBshgVKYOiNXyu
         ooukCHnBMOnYM/m9TZxQzuJzY7+B7+X8wEyqJMmwSw4bG47STpjGpwln/LhK61kGWHVz
         38Yw==
X-Gm-Message-State: AOJu0YzMIpodYR7CzeHI3NNE8BiSNkKhYrIq66g/Zcfsqt8Txih5t9Bg
        jTyPjqVEIEYYfecCwdRnYRpyJwhcp/baJV5DrEpbdQ==
X-Google-Smtp-Source: AGHT+IFBYZGzWAQTPXplY5U/FlDzvzxWuptyu00swf4QfQ9XFIj+FlFYBzhKRzYMzY3WDqIW2nbJAOHId8SGyAgT8sc=
X-Received: by 2002:a05:622a:1449:b0:403:d35d:4660 with SMTP id
 v9-20020a05622a144900b00403d35d4660mr217786qtx.11.1691167054974; Fri, 04 Aug
 2023 09:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <169057265801.180586.10867293237672839356.stgit@dwillia2-xfh.jf.intel.com>
 <CAMkAt6ot9zyUL9Ub-qYq+d9v-6rTft4ea2mUxp3o1s3GVFq7nw@mail.gmail.com>
 <CUHEL5OD3UR8.FRBWNF6MTP1Y@suppilovahvero> <64cc650233ef9_782a329489@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64cc650233ef9_782a329489@dwillia2-xfh.jf.intel.com.notmuch>
From:   Dionna Amalie Glaze <dionnaglaze@google.com>
Date:   Fri, 4 Aug 2023 09:37:23 -0700
Message-ID: <CAAH4kHY_SjTdh55NBWn1KURCdjJUDM7nhi_gLpUhKKbRsVjX4Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] keys: Introduce tsm keys
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        Peter Gonda <pgonda@google.com>, dhowells@redhat.com,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Samuel Ortiz <sameo@rivosinc.com>, peterz@infradead.org,
        linux-coco@lists.linux.dev, keyrings@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

> In this model the kernel is only a conduit to get 64-bytes of data
> signed by the report, and the kernel need not have any requirements on
> that data. That said, it could. That's where I would look to
> recommendations from Dionna and James and others about what contract the
> kernel *could*  enforce to ensure that best security practices are being
> deployed.  I expect that also helps this implementation cross the
> threshold from "blob store" to "key" as the Keyring expects.
>

I believe there is no security best practice here yet to enforce.

Attestation reports are a power feature, just like a TPM. A TPM
doesn't place any restriction on the format for its nonce, and like
James said, there's already a special entry point for TPM-wrapped keys
in the key API. Users have access to TPM quotes through /dev/tpm0 and
can pass whatever nonce. I don't think we need to limit access to the
interface this hardware gives us because we're trying to avoid another
char device by saying a report is a key.

The coming addition of the SVSM to further isolate the guest and
provide extra "security devices" is also something to be aware of.
There will be a vTPM protocol and a new type of attestation that's
rooted to VMPL0 while Linux is still in VMPL3. I don't think this will
make sev-guest an unnecessary device though, since it's still
undecided how the TPM hierarchy can bind itself to the hardware in a
non-adhoc manner: there's no "attested TPM" spec to have something
between the null hierarchy and the more persistent attestation key
hierarchy. And TCG isn't in the business of specifying how to
virtualize the TPM technology, so we might have to manually link the
two together by getting the tpm quote and then doing a further binding
operation with the sev-guest device.

So, can we give unfettered access to the hardware through not a Key
API but an Attestation API, and for historical reasons allow vTPM to
be its own thing with extra commands? The SVSM could allow users to
have access to more commands than getting an attestation report, like
a virtual HSM separate from the TPM. We wouldn't be able to access it
without a SEV-SNP-specific device. Does that mean it can't be
upstreamed? Do all confidential computing technologies specifically
not differentiate themselves in their capabilities to all use the same
kernel API for interaction?

-- 
-Dionna Glaze, PhD (she/her)
