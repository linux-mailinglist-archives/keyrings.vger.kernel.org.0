Return-Path: <keyrings+bounces-1227-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65178C62D2
	for <lists+keyrings@lfdr.de>; Wed, 15 May 2024 10:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43482B222F3
	for <lists+keyrings@lfdr.de>; Wed, 15 May 2024 08:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE924E1C9;
	Wed, 15 May 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cwxgy+og"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE34D9E0;
	Wed, 15 May 2024 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715761623; cv=none; b=jA2/UKAo0TyZEsFlCd99f6sZa+bDrhzq7zIG4D38W9ZhFUXNWScUiAyB35sGNmASlHvZYGesu1Nv0mLRxcAXR0OyebUZxh/oVTPq8j/RlRqZLxCsekANj1Z5stXNxgASTaNF8SyWHjcHOPe/eEzcTb9tCm/eHz0Nj++vL6PiyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715761623; c=relaxed/simple;
	bh=ynBlYuCFA5cv9VHYEdN8WUXOBWZ+lNuedFoHg+2tP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e895j4hKzv5DKO41DnXKcHxuS06i+Cl/Mjgc5FbM6EwNIs38ImmvNnqVonjdmWFcf4Uf9RDLIVQ4xYVYdhZZ0pIMPh8hfe+2BibN2Sx4GV5knc2KVClGUnFVegR3z3jzFPbGKKhtUI1zEL/tKXayuu3kz+JBnVRxDD/wO+umHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cwxgy+og; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D05C116B1;
	Wed, 15 May 2024 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715761622;
	bh=ynBlYuCFA5cv9VHYEdN8WUXOBWZ+lNuedFoHg+2tP+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwxgy+ogS3lJTQ3V23eeRlgDp8RGxMz9sHg6dUuY4VUV/XZAi9e5y0YbcUZGS50dk
	 RAs7bLZX59Yio3rZpkPZWg7DfXBf6ji+uDdoKFldgqIoGYoNoKEwqyPRhFsmi2KHQI
	 uYn7N5TWePGqkpG8E93tECZzrePpxQiTtPY6uTbw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Silvio Gissi <sifonsec@amazon.com>,
	David Howells <dhowells@redhat.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	keyrings@vger.kernel.org,
	netdev@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH 6.9 4/5] keys: Fix overwrite of key expiration on instantiation
Date: Wed, 15 May 2024 10:26:41 +0200
Message-ID: <20240515082346.076396212@linuxfoundation.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515082345.213796290@linuxfoundation.org>
References: <20240515082345.213796290@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Silvio Gissi <sifonsec@amazon.com>

commit 9da27fb65a14c18efd4473e2e82b76b53ba60252 upstream.

The expiry time of a key is unconditionally overwritten during
instantiation, defaulting to turn it permanent. This causes a problem
for DNS resolution as the expiration set by user-space is overwritten to
TIME64_MAX, disabling further DNS updates. Fix this by restoring the
condition that key_set_expiry is only called when the pre-parser sets a
specific expiry.

Fixes: 39299bdd2546 ("keys, dns: Allow key types (eg. DNS) to be reclaimed immediately on expiry")
Signed-off-by: Silvio Gissi <sifonsec@amazon.com>
cc: David Howells <dhowells@redhat.com>
cc: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
cc: linux-afs@lists.infradead.org
cc: linux-cifs@vger.kernel.org
cc: keyrings@vger.kernel.org
cc: netdev@vger.kernel.org
cc: stable@vger.kernel.org
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 security/keys/key.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -463,7 +463,8 @@ static int __key_instantiate_and_link(st
 			if (authkey)
 				key_invalidate(authkey);
 
-			key_set_expiry(key, prep->expiry);
+			if (prep->expiry != TIME64_MAX)
+				key_set_expiry(key, prep->expiry);
 		}
 	}
 



