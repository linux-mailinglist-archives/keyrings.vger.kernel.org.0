Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCA62F76CE
	for <lists+keyrings@lfdr.de>; Fri, 15 Jan 2021 11:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbhAOKlM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 05:41:12 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:46716 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOKlM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 Jan 2021 05:41:12 -0500
Received: by mail-io1-f42.google.com with SMTP id q2so15549439iow.13
        for <keyrings@vger.kernel.org>; Fri, 15 Jan 2021 02:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BZqnkoBN65dYFwWdcrLCUSBnW/KErMOB3BGSDaLiJ4=;
        b=QeZgW/lZEhqu+tcA0XZWnwql1mdAqysV1Vlkqdeid+58BgQm/DcEMLyRz5x3C68UMu
         BtGeb3ow6P7kXolfK917EiB54C0NVaO5jf+VsCRMkmQg2UUIEeiWai0W55oc1KfiVegG
         SU/tTMFm2wYghFjVcACJk+LJBahReXg59P4ZjOQDHmClyJXKj28/Y+xx1jibTE3RDwd4
         SrPHOrT6W9NagfCRjHPf24hF5vAqR5F3LnFzzUTZKFJotmpgmRrJnQwBKGbdlqDUmOpF
         oXk0YNc+ZPRdasWIpU1u5pshN2V9IA308ysIew7RMiuMUiY/GKYOusm64nG94I5BCa8S
         h6Yw==
X-Gm-Message-State: AOAM530QhcWrqncadw5Zl38QMa+I7kxaueKVOF/Pc+nuywd1nbsQhM1+
        NnI2VrX2CRjyTdQPRn9CEjwitFK6s8JBzQ==
X-Google-Smtp-Source: ABdhPJyc+knPm7jUnISiKuhUTXpco9duVrxYozwDDYsL9oMvn7312/fS3jmyj5nrmpmwf1gmH1mAJQ==
X-Received: by 2002:a02:2ace:: with SMTP id w197mr9767991jaw.132.1610707230124;
        Fri, 15 Jan 2021 02:40:30 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id m8sm5265075ild.18.2021.01.15.02.40.29
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 02:40:29 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id z5so17154483iob.11
        for <keyrings@vger.kernel.org>; Fri, 15 Jan 2021 02:40:29 -0800 (PST)
X-Received: by 2002:a02:1007:: with SMTP id 7mr9921053jay.73.1610707229413;
 Fri, 15 Jan 2021 02:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20210114204035.2046219-1-andrew.zaborowski@intel.com> <YAFQBT/pKw4PDenV@kernel.org>
In-Reply-To: <YAFQBT/pKw4PDenV@kernel.org>
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
Date:   Fri, 15 Jan 2021 11:40:18 +0100
X-Gmail-Original-Message-ID: <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
Message-ID: <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
Subject: Re: [PATCH v2] keys: X.509 public key issuer lookup without AKID
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 15 Jan 2021 at 09:20, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Thu, Jan 14, 2021 at 09:40:35PM +0100, Andrew Zaborowski wrote:
> > @@ -183,8 +193,8 @@ bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
> >  EXPORT_SYMBOL_GPL(asymmetric_key_id_partial);
> >
> >  /**
> > - * asymmetric_match_key_ids - Search asymmetric key IDs
> > - * @kids: The list of key IDs to check
> > + * asymmetric_match_key_ids - Search asymmetric key IDs 1 & 2
> > + * @kids: The pair of key IDs to check
> >   * @match_id: The key ID we're looking for
> >   * @match: The match function to use
> >   */
> > @@ -198,7 +208,7 @@ static bool asymmetric_match_key_ids(
> >
> >       if (!kids || !match_id)
> >               return false;
> > -     for (i = 0; i < ARRAY_SIZE(kids->id); i++)
> > +     for (i = 0; i < 2; i++)
> >               if (match(kids->id[i], match_id))
> >                       return true;
> >       return false;
>
> Why are key ID 2 and key ID 3 handled differently? They are both
> optional.

This is to minimise the impact of having a new ID added.  I guess the
danger is that it could add ambiguity in the lookup, i.e. a different
key could be returned for an existing search query.

There's a specific logic in how ID 1 and 2 interact documented as
follows in restrict.c:

                        * The first auth_id is the preferred id, and
                        * the second is the fallback. If only one
                        * auth_id is present, it may match against
                        * either signer_id. If two auth_ids are
                        * present, the first auth_id must match one
                        * signer_id and the second auth_id must match
                        * the second signer_id.

I'm not sure what the use case motivates this.  For the
x509_public_key subtype you'd expect that ID 1 in the signature
matches subject ID 1 of the issuer and ID 2 matches ID 2.  Most of the
time both will be present for a CA certificate.

I imagine restrict.c only tries to mirror the logic that was already
implemented in find_asymmetric_key when the restrict functions were
added.

For ID 2, only ever filled in by the x509_public_key subtype (right
now), we only have any use for it being matched against the issuer's
ID 2.

Note: asymmetric_match_key_ids can be used as part of a generic key
API query, or as part of a find_asymmetric_key call (only used in
crypto/asymmetric_keys/ for trust verification and similar) but
find_asymmetric_key will then perform an extra check.  In any case
without more background I think it's preferable to minimize the
matching logic changes, and even assuming that the logic could be
improved it may be best to keep it as is because existing tools may
rely on it.

>
> > @@ -242,7 +252,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
> >  }
> >
> >  /*
> > - * Match asymmetric keys by an exact match on an ID.
> > + * Match asymmetric keys by an exact match on one of the first two IDs.
> >   */
> >  static bool asymmetric_key_cmp(const struct key *key,
> >                              const struct key_match_data *match_data)
> > @@ -255,7 +265,7 @@ static bool asymmetric_key_cmp(const struct key *key,
> >  }
> >
> >  /*
> > - * Match asymmetric keys by a partial match on an IDs.
> > + * Match asymmetric keys by a partial match on one of the first two IDs.
> >   */
> >  static bool asymmetric_key_cmp_partial(const struct key *key,
> >                                      const struct key_match_data *match_data)
> > @@ -267,6 +277,18 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
> >                                       asymmetric_key_id_partial);
> >  }
> >
> > +/*
> > + * Match asymmetric keys by an exact match on the third IDs.
> > + */
> > +static bool asymmetric_key_cmp_name(const struct key *key,
> > +                                 const struct key_match_data *match_data)
> > +{
> > +     const struct asymmetric_key_ids *kids = asymmetric_key_ids(key);
> > +     const struct asymmetric_key_id *match_id = match_data->preparsed;
> > +
> > +     return kids && asymmetric_key_id_same(kids->id[2], match_id);
> > +}
> > +
> >  /*
> >   * Preparse the match criterion.  If we don't set lookup_type and cmp,
> >   * the default will be an exact match on the key description.
> > @@ -274,8 +296,9 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
> >   * There are some specifiers for matching key IDs rather than by the key
> >   * description:
> >   *
> > - *   "id:<id>" - find a key by partial match on any available ID
> > - *   "ex:<id>" - find a key by exact match on any available ID
> > + *   "id:<id>" - find a key by partial match on one of the first two IDs
> > + *   "ex:<id>" - find a key by exact match on one of the first two IDs
> > + *   "dn:<id>" - find a key by exact match on the third ID
> >   *
> >   * These have to be searched by iteration rather than by direct lookup because
> >   * the key is hashed according to its description.
> > @@ -299,6 +322,11 @@ static int asymmetric_key_match_preparse(struct key_match_data *match_data)
> >                  spec[1] == 'x' &&
> >                  spec[2] == ':') {
> >               id = spec + 3;
> > +     } else if (spec[0] == 'd' &&
> > +                spec[1] == 'n' &&
> > +                spec[2] == ':') {
> > +             id = spec + 3;
> > +             cmp = asymmetric_key_cmp_name;
> >       } else {
> >               goto default_match;
> >       }
> > diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_keys/pkcs7_trust.c
> > index 61af3c4d82c..998ba0e2ffb 100644
> > --- a/crypto/asymmetric_keys/pkcs7_trust.c
> > +++ b/crypto/asymmetric_keys/pkcs7_trust.c
> > @@ -48,7 +48,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
> >                * keys.
> >                */
> >               key = find_asymmetric_key(trust_keyring,
> > -                                       x509->id, x509->skid, false);
> > +                                       x509->id, x509->skid, NULL, false);
> >               if (!IS_ERR(key)) {
> >                       /* One of the X.509 certificates in the PKCS#7 message
> >                        * is apparently the same as one we already trust.
> > @@ -82,7 +82,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
> >               key = find_asymmetric_key(trust_keyring,
> >                                         last->sig->auth_ids[0],
> >                                         last->sig->auth_ids[1],
> > -                                       false);
> > +                                       NULL, false);
> >               if (!IS_ERR(key)) {
> >                       x509 = last;
> >                       pr_devel("sinfo %u: Root cert %u signer is key %x\n",
> > @@ -97,7 +97,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
> >        * the signed info directly.
> >        */
> >       key = find_asymmetric_key(trust_keyring,
> > -                               sinfo->sig->auth_ids[0], NULL, false);
> > +                               sinfo->sig->auth_ids[0], NULL, NULL, false);
> >       if (!IS_ERR(key)) {
> >               pr_devel("sinfo %u: Direct signer is key %x\n",
> >                        sinfo->index, key_serial(key));
> > diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
> > index 77ebebada29..f77875ec942 100644
> > --- a/crypto/asymmetric_keys/restrict.c
> > +++ b/crypto/asymmetric_keys/restrict.c
> > @@ -87,7 +87,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
> >       sig = payload->data[asym_auth];
> >       if (!sig)
> >               return -ENOPKG;
> > -     if (!sig->auth_ids[0] && !sig->auth_ids[1])
> > +     if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
> >               return -ENOKEY;
> >
> >       if (ca_keyid && !asymmetric_key_id_partial(sig->auth_ids[1], ca_keyid))
> > @@ -96,7 +96,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
> >       /* See if we have a key that signed this one. */
> >       key = find_asymmetric_key(trust_keyring,
> >                                 sig->auth_ids[0], sig->auth_ids[1],
> > -                               false);
> > +                               sig->auth_ids[2], false);
> >       if (IS_ERR(key))
> >               return -ENOKEY;
> >
> > @@ -108,11 +108,11 @@ int restrict_link_by_signature(struct key *dest_keyring,
> >       return ret;
> >  }
> >
> > -static bool match_either_id(const struct asymmetric_key_ids *pair,
> > +static bool match_either_id(const struct asymmetric_key_id **pair,
> >                           const struct asymmetric_key_id *single)
> >  {
> > -     return (asymmetric_key_id_same(pair->id[0], single) ||
> > -             asymmetric_key_id_same(pair->id[1], single));
> > +     return (asymmetric_key_id_same(pair[0], single) ||
> > +             asymmetric_key_id_same(pair[1], single));
> >  }
> >
> >  static int key_or_keyring_common(struct key *dest_keyring,
> > @@ -140,20 +140,22 @@ static int key_or_keyring_common(struct key *dest_keyring,
> >       sig = payload->data[asym_auth];
> >       if (!sig)
> >               return -ENOPKG;
> > -     if (!sig->auth_ids[0] && !sig->auth_ids[1])
> > +     if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
> >               return -ENOKEY;
> >
> >       if (trusted) {
> >               if (trusted->type == &key_type_keyring) {
> >                       /* See if we have a key that signed this one. */
> >                       key = find_asymmetric_key(trusted, sig->auth_ids[0],
> > -                                               sig->auth_ids[1], false);
> > +                                               sig->auth_ids[1],
> > +                                               sig->auth_ids[2], false);
> >                       if (IS_ERR(key))
> >                               key = NULL;
> >               } else if (trusted->type == &key_type_asymmetric) {
> > -                     const struct asymmetric_key_ids *signer_ids;
> > +                     const struct asymmetric_key_id **signer_ids;
> >
> > -                     signer_ids = asymmetric_key_ids(trusted);
> > +                     signer_ids = (const struct asymmetric_key_id **)
> > +                             asymmetric_key_ids(trusted)->id;
> >
> >                       /*
> >                        * The auth_ids come from the candidate key (the
> > @@ -164,22 +166,29 @@ static int key_or_keyring_common(struct key *dest_keyring,
> >                        * The signer_ids are identifiers for the
> >                        * signing key specified for dest_keyring.
> >                        *
> > -                      * The first auth_id is the preferred id, and
> > -                      * the second is the fallback. If only one
> > -                      * auth_id is present, it may match against
> > -                      * either signer_id. If two auth_ids are
> > -                      * present, the first auth_id must match one
> > -                      * signer_id and the second auth_id must match
> > -                      * the second signer_id.
> > +                      * The first auth_id is the preferred id, 2nd and
> > +                      * 3rd are the fallbacks. If excatly one of
> > +                      * auth_ids[0] and auth_ids[1] is present, it may
> > +                      * match either signer_ids[0] or signed_ids[1].
> > +                      * If both are present the first one may match
> > +                      * either signed_id but the second one must match
> > +                      * the second signer_id. If neither of them is
> > +                      * available, auth_ids[2] is matched against
> > +                      * signer_ids[2] as a fallback.
> >                        */
> > -                     if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
> > +                     if (!sig->auth_ids[0] && !sig->auth_ids[1]) {
> > +                             if (asymmetric_key_id_same(signer_ids[2],
> > +                                                        sig->auth_ids[2]))
> > +                                     key = __key_get(trusted);
> > +
> > +                     } else if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
> >                               const struct asymmetric_key_id *auth_id;
> >
> >                               auth_id = sig->auth_ids[0] ?: sig->auth_ids[1];
> >                               if (match_either_id(signer_ids, auth_id))
> >                                       key = __key_get(trusted);
> >
> > -                     } else if (asymmetric_key_id_same(signer_ids->id[1],
> > +                     } else if (asymmetric_key_id_same(signer_ids[1],
> >                                                         sig->auth_ids[1]) &&
> >                                  match_either_id(signer_ids,
> >                                                  sig->auth_ids[0])) {
> > @@ -193,7 +202,8 @@ static int key_or_keyring_common(struct key *dest_keyring,
> >       if (check_dest && !key) {
> >               /* See if the destination has a key that signed this one. */
> >               key = find_asymmetric_key(dest_keyring, sig->auth_ids[0],
> > -                                       sig->auth_ids[1], false);
> > +                                       sig->auth_ids[1], sig->auth_ids[2],
> > +                                       false);
> >               if (IS_ERR(key))
> >                       key = NULL;
> >       }
> > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > index 52c9b455fc7..59dfffa77cf 100644
> > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > @@ -415,8 +415,18 @@ int x509_note_issuer(void *context, size_t hdrlen,
> >                    const void *value, size_t vlen)
> >  {
> >       struct x509_parse_context *ctx = context;
> > +     struct asymmetric_key_id *kid;
> > +
> >       ctx->cert->raw_issuer = value;
> >       ctx->cert->raw_issuer_size = vlen;
> > +
> > +     if (!ctx->cert->sig->auth_ids[2]) {
> > +             kid = asymmetric_key_generate_id(value, vlen, "", 0);
> > +             if (IS_ERR(kid))
> > +                     return PTR_ERR(kid);
> > +             ctx->cert->sig->auth_ids[2] = kid;
> > +     }
> > +
> >       return x509_fabricate_name(ctx, hdrlen, tag, &ctx->cert->issuer, vlen);
> >  }
> >
> > diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> > index ae450eb8be1..a95cc351518 100644
> > --- a/crypto/asymmetric_keys/x509_public_key.c
> > +++ b/crypto/asymmetric_keys/x509_public_key.c
> > @@ -221,6 +221,13 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
> >               goto error_free_desc;
> >       kids->id[0] = cert->id;
> >       kids->id[1] = cert->skid;
> > +     kids->id[2] = asymmetric_key_generate_id(cert->raw_subject,
> > +                                              cert->raw_subject_size,
> > +                                              "", 0);
> > +     if (IS_ERR(kids->id[2])) {
> > +             ret = PTR_ERR(kids->id[2]);
> > +             goto error_free_kids;
> > +     }
> >
> >       /* We're pinning the module by being linked against it */
> >       __module_get(public_key_subtype.owner);
> > @@ -237,8 +244,11 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
> >       cert->skid = NULL;
> >       cert->sig = NULL;
> >       desc = NULL;
> > +     kids = NULL;
> >       ret = 0;
> >
> > +error_free_kids:
> > +     kfree(kids);
> >  error_free_desc:
> >       kfree(desc);
> >  error_free_cert:
> > diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> > index 948c5203ca9..4819e63a772 100644
> > --- a/include/crypto/public_key.h
> > +++ b/include/crypto/public_key.h
> > @@ -37,7 +37,7 @@ extern void public_key_free(struct public_key *key);
> >   * Public key cryptography signature data
> >   */
> >  struct public_key_signature {
> > -     struct asymmetric_key_id *auth_ids[2];
> > +     struct asymmetric_key_id *auth_ids[3];
> >       u8 *s;                  /* Signature */
> >       u32 s_size;             /* Number of bytes in signature */
> >       u8 *digest;
> > diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
> > index a29d3ff2e7e..344ab9f178d 100644
> > --- a/include/keys/asymmetric-type.h
> > +++ b/include/keys/asymmetric-type.h
> > @@ -53,7 +53,7 @@ struct asymmetric_key_id {
> >  };
> >
> >  struct asymmetric_key_ids {
> > -     void            *id[2];
> > +     void            *id[3];
> >  };
> >
> >  extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
> > @@ -75,6 +75,7 @@ const struct asymmetric_key_ids *asymmetric_key_ids(const struct key *key)
> >  extern struct key *find_asymmetric_key(struct key *keyring,
> >                                      const struct asymmetric_key_id *id_0,
> >                                      const struct asymmetric_key_id *id_1,
> > +                                    const struct asymmetric_key_id *id_2,
> >                                      bool partial);
> >
> >  /*
> > --
> > 2.27.0
> >
> >
>
> This gives checkpatch error but is not due to this patch. I sent a
> bug fix (and also cc'd you to that). I'll apply that to my tree as
> soon as I get it ack'd first.

Ok, great.  I'll run checkpatch next time I'm sending a version of this patch.

Best regards
