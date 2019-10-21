Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5EEDF1FA
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2019 17:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbfJUPrt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Oct 2019 11:47:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:12531 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727607AbfJUPrt (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 21 Oct 2019 11:47:49 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 08:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; 
   d="scan'208";a="222504251"
Received: from cweir2-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.9.177])
  by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2019 08:47:42 -0700
Date:   Mon, 21 Oct 2019 18:47:39 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Chris von Recklinghausen <crecklin@redhat.com>
Cc:     David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] security/keyring: avoid pagefaults in
 keyring_read_iterator
Message-ID: <20191021154717.GA4525@linux.intel.com>
References: <20191018184030.8407-1-crecklin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018184030.8407-1-crecklin@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Oct 18, 2019 at 02:40:30PM -0400, Chris von Recklinghausen wrote:
> under a debug kernel, the following circular locking dependency was observed:
> 
> [ 5896.294840] ======================================================
> [ 5896.294846] [ INFO: possible circular locking dependency detected ]
> [ 5896.294852] 3.10.0-957.31.1.el7.ppc64le.debug #1 Tainted: G           OE  ------------ T
> [ 5896.294857] -------------------------------------------------------
> [ 5896.294863] keyctl/21719 is trying to acquire lock:
> [ 5896.294867]  (&mm->mmap_sem){++++++}, at: [<c000000000331db8>] might_fault+0x88/0xf0
> [ 5896.294881]
> [ 5896.294881] but task is already holding lock:
> [ 5896.294886]  (&type->lock_class){+++++.}, at: [<c0000000004ff504>] keyctl_read_key+0xb4/0x170
> [ 5896.294899]
> [ 5896.294899] which lock already depends on the new lock.
> [ 5896.294899]
> [ 5896.294905]
> [ 5896.294905] the existing dependency chain (in reverse order) is:
> [ 5896.294911]
> -> #1 (&type->lock_class){+++++.}:
> [ 5896.294920]        [<c0000000001caaf4>] check_prevs_add+0x144/0x1d0
> [ 5896.294929]        [<c0000000001ce338>] lock_acquire+0xe38/0x16c0
> [ 5896.294936]        [<c000000000b8e5e4>] down_write+0x84/0x130
> [ 5896.294943]        [<c0000000004fd330>] key_link+0x90/0x2e0
> [ 5896.294949]        [<c000000000503f44>] call_sbin_request_key+0x154/0x640
> [ 5896.294956]        [<c000000000bb1424>] construct_key_and_link+0x38c/0x464
> [ 5896.294964]        [<c000000000504bb4>] request_key+0x214/0x230
> [ 5896.294970]        [<d0000000047e2490>] nfs_idmap_get_key+0x110/0x460 [nfsv4]
> [ 5896.294986]        [<d0000000047e3464>] nfs_map_name_to_uid+0x84/0x2f0 [nfsv4]
> [ 5896.294999]        [<d0000000047c3180>] decode_attr_owner+0x1d0/0x2c0 [nfsv4]
> [ 5896.295010]        [<d0000000047c6f18>] decode_getfattr_attrs+0x5a8/0xb80 [nfsv4]
> [ 5896.295022]        [<d0000000047c75cc>] decode_getfattr_generic.constprop.100+0xdc/0x200 [nfsv4]
> [ 5896.295033]        [<d0000000047c8048>] nfs4_xdr_dec_getattr+0xa8/0xb0 [nfsv4]
> [ 5896.295044]        [<d0000000035eff58>] rpcauth_unwrap_resp+0xf8/0x150 [sunrpc]
> [ 5896.295060]        [<d0000000035d357c>] call_decode+0x29c/0x910 [sunrpc]
> [ 5896.295071]        [<d0000000035eb940>] __rpc_execute+0xf0/0x870 [sunrpc]
> [ 5896.295083]        [<d0000000035d233c>] rpc_run_task+0x14c/0x1c0 [sunrpc]
> [ 5896.295094]        [<d0000000047a12f0>] nfs4_call_sync_sequence+0x70/0xb0 [nfsv4]
> [ 5896.295105]        [<d0000000047a2254>] _nfs4_proc_getattr+0xc4/0xf0 [nfsv4]
> [ 5896.295115]        [<d0000000047b9ee4>] nfs4_proc_getattr+0x84/0x220 [nfsv4]
> [ 5896.295126]        [<d00000000454519c>] __nfs_revalidate_inode+0x1cc/0x7a0 [nfs]
> [ 5896.295138]        [<d000000004546284>] nfs_revalidate_mapping+0x1f4/0x520 [nfs]
> [ 5896.295150]        [<d00000000453df98>] nfs_file_mmap+0x78/0xb0 [nfs]
> [ 5896.295160]        [<c000000000343df8>] mmap_region+0x518/0x780
> [ 5896.295167]        [<c000000000344488>] do_mmap+0x428/0x510
> [ 5896.295173]        [<c000000000317508>] vm_mmap_pgoff+0x108/0x150
> [ 5896.295179]        [<c000000000340f1c>] SyS_mmap_pgoff+0xec/0x2c0
> [ 5896.295186]        [<c0000000000173b8>] sys_mmap+0x78/0x90
> [ 5896.295192]        [<c00000000000a294>] system_call+0x3c/0x100
> [ 5896.295199]
> -> #0 (&mm->mmap_sem){++++++}:
> [ 5896.295207]        [<c0000000001ca990>] check_prev_add+0xa50/0xa70
> [ 5896.295214]        [<c0000000001caaf4>] check_prevs_add+0x144/0x1d0
> [ 5896.295221]        [<c0000000001ce338>] lock_acquire+0xe38/0x16c0
> [ 5896.295228]        [<c000000000331de4>] might_fault+0xb4/0xf0
> [ 5896.295235]        [<c0000000004fc644>] keyring_read_iterator+0x54/0xd0
> [ 5896.295242]        [<c00000000060fe98>] assoc_array_subtree_iterate+0x4d8/0x790
> [ 5896.295249]        [<c0000000004fbc00>] keyring_read+0x80/0xa0
> [ 5896.295255]        [<c0000000004ff5a4>] keyctl_read_key+0x154/0x170
> [ 5896.295262]        [<c00000000000a294>] system_call+0x3c/0x100
> [ 5896.295269]
> [ 5896.295269] other info that might help us debug this:
> [ 5896.295275]  Possible unsafe locking scenario:
> [ 5896.295275]
> [ 5896.295281]        CPU0                    CPU1
> [ 5896.295285]        ----                    ----
> [ 5896.295289]   lock(&type->lock_class);
> [ 5896.295294]                                lock(&mm->mmap_sem);
> [ 5896.295301]                                lock(&type->lock_class);
> [ 5896.295308]   lock(&mm->mmap_sem);
> [ 5896.295313]
> [ 5896.295313]  *** DEADLOCK ***
> [ 5896.295313]
> [ 5896.295320] 1 lock held by keyctl/21719:
> [ 5896.295323]  #0:  (&type->lock_class){+++++.}, at: [<c0000000004ff504>] keyctl_read_key+0xb4/0x170
> [ 5896.295337]
> [ 5896.295337] stack backtrace:
> [ 5896.295343] CPU: 1 PID: 21719 Comm: keyctl Kdump: loaded Tainted: G           OE  ------------ T 3.10.0-957.31.1.el7.ppc64le.debug #1
> [ 5896.295351] Call Trace:
> [ 5896.295355] [c00000016100f8e0] [c0000000000205d0] show_stack+0x90/0x390 (unreliable)
> [ 5896.295363] [c00000016100f9a0] [c000000000bb37d0] dump_stack+0x30/0x44
> [ 5896.295371] [c00000016100f9c0] [c000000000ba7f3c] print_circular_bug+0x36c/0x3a0
> [ 5896.295379] [c00000016100fa60] [c0000000001ca990] check_prev_add+0xa50/0xa70
> [ 5896.295386] [c00000016100fb60] [c0000000001caaf4] check_prevs_add+0x144/0x1d0
> [ 5896.295393] [c00000016100fbb0] [c0000000001ce338] lock_acquire+0xe38/0x16c0
> [ 5896.295400] [c00000016100fce0] [c000000000331de4] might_fault+0xb4/0xf0
> [ 5896.295407] [c00000016100fd00] [c0000000004fc644] keyring_read_iterator+0x54/0xd0
> [ 5896.295415] [c00000016100fd40] [c00000000060fe98] assoc_array_subtree_iterate+0x4d8/0x790
> [ 5896.295423] [c00000016100fd90] [c0000000004fbc00] keyring_read+0x80/0xa0
> [ 5896.295430] [c00000016100fde0] [c0000000004ff5a4] keyctl_read_key+0x154/0x170
> [ 5896.295437] [c00000016100fe30] [c00000000000a294] system_call+0x3c/0x100
> 
> The put_user call from keyring_read_iterator caused a page fault which attempts
> to lock mm->mmap_sem and type->lock_class (key->sem) in the reverse order that
> keyring_read_iterator did, thus causing the circular locking dependency.
> 
> Remedy this by using access_ok and __put_user instead of put_user so we'll
> return an error instead of faulting in the page.
> 
> Also to prevent potential changes in behavior to applications, pre-fault the
> page(s) with the key in keyctl_read_key before taking the read semaphore to
> ensure that the page is present by the time keyring_read_iterator is called.
> 
> Suggested-by: Waiman Long <longman@redhat.com>
> Signed-off-by: Chris von Recklinghausen <crecklin@redhat.com>
> ---
>  security/keys/keyctl.c  | 10 ++++++++--
>  security/keys/keyring.c |  7 +++----
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 9b898c9..f8a2553 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -846,9 +846,15 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  can_read_key:
>  	ret = -EOPNOTSUPP;
>  	if (key->type->read) {
> -		/* Read the data with the semaphore held (since we might sleep)
> -		 * to protect against the key being updated or revoked.
> +		/*
> +		 * Read the data with the semaphore held (since we might sleep)
> +		 * to protect against the key being updated or revoked. The
> +		 * user buffer, if not mapped yet, will be faulted in to
> +		 * prevent read failure.
>  		 */
> +		key_serial_t tmp;
> +
> +		get_user(tmp, buffer);  /* Prefault */
>  		down_read(&key->sem);
>  		ret = key_validate(key);
>  		if (ret == 0)
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index febf36c..7cac3c7 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -459,7 +459,6 @@ static int keyring_read_iterator(const void *object, void *data)
>  {
>  	struct keyring_read_iterator_context *ctx = data;
>  	const struct key *key = keyring_ptr_to_key(object);
> -	int ret;
>  
>  	kenter("{%s,%d},,{%zu/%zu}",
>  	       key->type->name, key->serial, ctx->count, ctx->buflen);
> @@ -467,9 +466,9 @@ static int keyring_read_iterator(const void *object, void *data)
>  	if (ctx->count >= ctx->buflen)
>  		return 1;
>  
> -	ret = put_user(key->serial, ctx->buffer);
> -	if (ret < 0)
> -		return ret;
> +	if (!access_ok(ctx->buffer, sizeof(key->serial)) ||
> +		__put_user(key->serial, ctx->buffer) < 0)
> +		return -EFAULT;
>  	ctx->buffer++;
>  	ctx->count += sizeof(key->serial);
>  	return 0;
> -- 
> 1.8.3.1
> 

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
