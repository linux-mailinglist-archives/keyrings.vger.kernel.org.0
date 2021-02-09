Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F62314FEA
	for <lists+keyrings@lfdr.de>; Tue,  9 Feb 2021 14:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhBINPr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Feb 2021 08:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54039 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230409AbhBINPo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Feb 2021 08:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612876458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZJO2coTOPSTpGO+5F/K+/F71lw3kWLqwpbNc9WcP6uE=;
        b=e535usWZ+cAYkvEkUpetu9XTS68VSpsEhhdJ8rwpHAa7n8qyJeSElZSgwQcxTVkY6qmmph
        qLG/+FjhYzhO4iOeKaBxpiOoBe4Alqxep4d1Bsrmj76S7KR34lkXiDj5HsYbTV7kSuqMJJ
        0BV1CwQe1AUX9+EqWVzZDRhX1zqM/9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-rLjhSlqKPti5cKiHGW7mzQ-1; Tue, 09 Feb 2021 08:14:17 -0500
X-MC-Unique: rLjhSlqKPti5cKiHGW7mzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 049E9CE647;
        Tue,  9 Feb 2021 13:14:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D1F401725E;
        Tue,  9 Feb 2021 13:14:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com>
References: <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com> <20210122181054.32635-1-eric.snowberg@oracle.com> <1103491.1612369600@warthog.procyon.org.uk> <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net> <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com> <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net> <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com> <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net> <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com> <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
To:     Eric Snowberg <eric.snowberg@oracle.com>,
        =?us-ascii?Q?=3D=3Futf-8=3FQ=3FMicka=3DC3=3DABl=5FSala=3DC3=3DBCn=3F?=
         =?us-ascii?Q?=3D?= <mic@digikod.net>
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Subject: Re: Re: Conflict with =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn's?=
 blacklist patches [was [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for
 dbx/mokx entries]
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 09 Feb 2021 13:14:06 +0000
Message-ID: <525705.1612876446@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Eric, Micka=C3=ABl,

Do we have a consensus on this?  From what's written here, I don't think I =
can
ask Linus to pull the merge of your two branches.  I feel that I probably n=
eed
to push Eric's first as that fixes a CVE if I can't offer a merge.

David

