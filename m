Return-Path: <keyrings+bounces-2211-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A59A006E
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 07:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BEABB20D4C
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 05:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCAB18A937;
	Wed, 16 Oct 2024 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqHZaAqA"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA79187855;
	Wed, 16 Oct 2024 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729055344; cv=none; b=HZWJ7m5Vi2Kd8HDjG1ze6uT4ilAXXYSgfZAArY2PctntOdcBB6m7KNm3E9POmxmYzpYtkcWJ0EJZ3wfO0m3+MFPbCZOHZXwMSKDCHKa2CjZ+K0G6ImLSOhhqU1jjaLnLsNh9j1U4LGQYvD7E8mCXGgc/FWIQnbwBjUj5vBwOkhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729055344; c=relaxed/simple;
	bh=JLXYXxyfpJbYidhHWL7ZXeuggLwS4mL+IYdcB1wZtqo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YKoyhnpTw/NSh9tWOYP8P+jAXNlZPRLefpIungqrNd5fJgakzQKIKeHePiFO8rkRdu0iDrJCOyZqefH/aljEmg87cJPrrJ7REuJOfJ1brjhvSXPB3yubwes5c1+xprxt2sE66U4bjnBMM7HojOoOL0djLYJrC47rJfho/pkFrvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqHZaAqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27728C4CEC5;
	Wed, 16 Oct 2024 05:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729055343;
	bh=JLXYXxyfpJbYidhHWL7ZXeuggLwS4mL+IYdcB1wZtqo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iqHZaAqAIN0jaL74UdRJGqBnBp3a1V3dBOmQPlognCRiXAaR/85Hz37XPQI+5JHNt
	 tK5plNl7zyS7He1K/N8sJmIANfsnCezkCbHY9YWuCGqFfj9l6zZOcUW4HHape4c8MR
	 b6WrJjgiU+teLZnu3mzbyUIZ1DzYvAsmu9yA7jCoEYo30R0h5Oo1FXqYwNGV3OO2Xv
	 5NwcJrLTQKLSzKNgFEwl6Oc2f465/lvLHdQVk87XJNETNXGMA6Uo0GqM2xDHsQwvZd
	 C8Kp/iEQQJHWiXson2o+dl77eag1M/+nlpFJBkZ+AOyXUpl2oCGyPifxePltzzertP
	 J5WwRxKmb23uA==
Message-ID: <021c2dffc7ced6030213a9cfa7939a34193a3cd4.camel@kernel.org>
Subject: Re: [PATCH v2] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>, dhowells@redhat.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 16 Oct 2024 08:08:59 +0300
In-Reply-To: <d3fb6263-b1f3-4bcd-b28e-abd81fbbd711@huaweicloud.com>
References: <20241008124639.70000-1-chenridong@huaweicloud.com>
	 <d3fb6263-b1f3-4bcd-b28e-abd81fbbd711@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-16 at 09:33 +0800, Chen Ridong wrote:
>=20
>=20
> On 2024/10/8 20:46, Chen Ridong wrote:
> > From: Chen Ridong <chenridong@huawei.com>
> >=20
> > KASAN reports an out of bounds read:
> > BUG: KASAN: slab-out-of-bounds in __kuid_val
> > include/linux/uidgid.h:36
> > BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63
> > [inline]
> > BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> > security/keys/permission.c:54
> > Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
> >=20
> > CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-
> > gafbffd6c3ede #15
> > Call Trace:
> > =C2=A0 __dump_stack lib/dump_stack.c:82 [inline]
> > =C2=A0 dump_stack+0x107/0x167 lib/dump_stack.c:123
> > =C2=A0 print_address_description.constprop.0+0x19/0x170
> > mm/kasan/report.c:400
> > =C2=A0 __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
> > =C2=A0 kasan_report+0x3a/0x50 mm/kasan/report.c:585
> > =C2=A0 __kuid_val include/linux/uidgid.h:36 [inline]
> > =C2=A0 uid_eq include/linux/uidgid.h:63 [inline]
> > =C2=A0 key_task_permission+0x394/0x410 security/keys/permission.c:54
> > =C2=A0 search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
> >=20
> > This issue was also reported by syzbot [1].
> >=20
> > It can be reproduced by following these steps(more details [2]):
> > 1. Obtain more than 32 inputs that have similar hashes, which ends
> > with the
> > =C2=A0=C2=A0=C2=A0 pattern '0xxxxxxxe6'.
> > 2. Reboot and add the keys obtained in step 1.
> >=20
> > The reproducer demonstrates how this issue happened:
> > 1. In the search_nested_keyrings function, when it iterates through
> > the
> > =C2=A0=C2=A0=C2=A0 slots in a node(below tag ascend_to_node), if the sl=
ot pointer
> > is meta
> > =C2=A0=C2=A0=C2=A0 and node->back_pointer !=3D NULL(it means a root), i=
t will
> > proceed to
> > =C2=A0=C2=A0=C2=A0 descend_to_node. However, there is an exception. If =
node is the
> > root,
> > =C2=A0=C2=A0=C2=A0 and one of the slots points to a shortcut, it will b=
e treated
> > as a
> > =C2=A0=C2=A0=C2=A0 keyring.
> > 2. Whether the ptr is keyring decided by keyring_ptr_is_keyring
> > function.
> > =C2=A0=C2=A0=C2=A0 However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
> > =C2=A0=C2=A0=C2=A0 ASSOC_ARRAY_PTR_SUBTYPE_MASK.
> > 3. When 32 keys with the similar hashes are added to the tree, the
> > ROOT
> > =C2=A0=C2=A0=C2=A0 has keys with hashes that are not similar (e.g. slot=
 0) and it
> > splits
> > =C2=A0=C2=A0=C2=A0 NODE A without using a shortcut. When NODE A is fill=
ed with
> > keys that
> > =C2=A0=C2=A0=C2=A0 all hashes are xxe6, the keys are similar, NODE A wi=
ll split
> > with a
> > =C2=A0=C2=A0=C2=A0 shortcut. Finally, it forms the tree as shown below,=
 where slot
> > 6 points
> > =C2=A0=C2=A0=C2=A0 to a shortcut.
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NODE A
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +------>+---+
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ROOT=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0 | xxe6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +---+
> > =C2=A0 xxxx | 0 | shortcut=C2=A0 :=C2=A0=C2=A0 : xxe6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +---+
> > =C2=A0 xxe6 :=C2=A0=C2=A0 :=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 | xxe6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +---+
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 |---+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :=C2=A0=C2=A0 : xxe6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+
> > =C2=A0 xxe6 :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | f | xxe6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+
> > =C2=A0 xxe6 | f |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---+
> >=20
> > 4. As mentioned above, If a slot(slot 6) of the root points to a
> > shortcut,
> > =C2=A0=C2=A0=C2=A0 it may be mistakenly transferred to a key*, leading =
to a read
> > =C2=A0=C2=A0=C2=A0 out-of-bounds read.
> >=20
> > To fix this issue, one should jump to descend_to_node if the ptr is
> > a
> > shortcut, regardless of whether the node is root or not.
> >=20
> > [1]
> > https://lore.kernel.org/all/000000000000cbb7860611f61147@google.com/T/
> > [2]
> > https://lore.kernel.org/linux-kernel/1cfa878e-8c7b-4570-8606-21daf5e13c=
e7@huaweicloud.com/
> >=20
> > Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
> > Reported-by: syzbot+5b415c07907a2990d1a3@syzkaller.appspotmail.com
> > Signed-off-by: Chen Ridong <chenridong@huawei.com>
> > ---
> > =C2=A0 security/keys/keyring.c | 7 +++++--
> > =C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> > index 4448758f643a..f331725d5a37 100644
> > --- a/security/keys/keyring.c
> > +++ b/security/keys/keyring.c
> > @@ -772,8 +772,11 @@ static bool search_nested_keyrings(struct key
> > *keyring,
> > =C2=A0=C2=A0	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
> > =C2=A0=C2=A0		ptr =3D READ_ONCE(node->slots[slot]);
> > =C2=A0=20
> > -		if (assoc_array_ptr_is_meta(ptr) && node-
> > >back_pointer)
> > -			goto descend_to_node;
> > +		if (assoc_array_ptr_is_meta(ptr)) {
> > +			if (node->back_pointer ||
> > +			=C2=A0=C2=A0=C2=A0 assoc_array_ptr_is_shortcut(ptr))
> > +				goto descend_to_node;
> > +		}
> > =C2=A0=20
> > =C2=A0=C2=A0		if (!keyring_ptr_is_keyring(ptr))
> > =C2=A0=C2=A0			continue;
>=20
> Friendly ping.

Thanks for pinging because I actually accidentally missed the original
email!

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I'll pick this up.

>=20
> Best regards,
> Ridong
>=20
>=20

BR, Jarkko

