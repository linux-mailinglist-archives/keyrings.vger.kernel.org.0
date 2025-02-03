Return-Path: <keyrings+bounces-2383-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B4A25203
	for <lists+keyrings@lfdr.de>; Mon,  3 Feb 2025 06:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45CC63A3A1B
	for <lists+keyrings@lfdr.de>; Mon,  3 Feb 2025 05:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953A41F92A;
	Mon,  3 Feb 2025 05:19:41 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012D179BD;
	Mon,  3 Feb 2025 05:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738559981; cv=none; b=Wlzzis+jiDmZyw3e+/L8hNRrDU7wElHLxXlMhsgmg0tP6vEGkEUOzBnfGwuF6farx4WxM5BPoG7Wpr2oONXoKwoG6e9XcdCkgtqzYzWi3e+vSEmaLLqgYMQS5w0eihcHTw6peY9p0Bp9D6BGWQzHL6ouNeCZI49IxY9mGPaOIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738559981; c=relaxed/simple;
	bh=KLdFebXBpeZ308AAo6X2B3urF20DyZGP5SGwBHldIA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzD7Z18LHiTipP/D8NwGA2PBRgFxUHdULzmqlCL7XQgz/5IcCnr3LZh0gw8+y+misoUbLjNauBd2YdT51NlpvbI2uefriTCcvHJRmh/MTzWCmtJqRsbKmpFRFadEZJfod5F2Ufwj1Nwgi7PCFarzTbziaOD12gcJ5NiZBJhu+34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 3BCEC28003447;
	Mon,  3 Feb 2025 06:11:55 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 288494AB46D; Mon,  3 Feb 2025 06:11:55 +0100 (CET)
Date: Mon, 3 Feb 2025 06:11:55 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 2/4] crypto: ecdsa - Harden against integer overflows
 in DIV_ROUND_UP()
Message-ID: <Z6BQGxHbdWiIGlp6@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <9143947a5a706d3c9b9857c47ddb5159181c16cf.1738521533.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9143947a5a706d3c9b9857c47ddb5159181c16cf.1738521533.git.lukas@wunner.de>

On Sun, Feb 02, 2025 at 08:00:52PM +0100, Lukas Wunner wrote:
> Herbert notes that DIV_ROUND_UP() may overflow unnecessarily if an ecdsa
> implementation's ->key_size() callback returns an unusually large value.
> Herbert instead suggests (for a division by 8):
> 
>   X / 8 + !!(X & 7)
> 
> Based on this formula, introduce a generic DIV_ROUND_UP_POW2() macro and
> use it in lieu of DIV_ROUND_UP() for ->key_size() return values.

FWIW, I've explored amending DIV_ROUND_UP() to automatically invoke
DIV_ROUND_UP_POW2() for constant power-of-2 divisors, like this:

#define DIV_ROUND_UP(n, d)						\
	(__builtin_constant_p(d) && is_power_of_2(d)			\
		? DIV_ROUND_UP_POW2(n, d)				\
		: __KERNEL_DIV_ROUND_UP(n, d))

Unfortunately gcc then complains about arrays sized with DIV_ROUND_UP().
It's possible to work around that by changing those occurrences to
__KERNEL_DIV_ROUND_UP().

The resulting patch is below.  It can be applied on top of this series.
I think it's somewhat intrusive and thus unpleasant, so I decided against
this approach for now and instead kept usage of DIV_ROUND_UP_POW2() local
to ecdsa.

But I'm considering submitting the below patch as an RFC to the
linux-hardening folks.  At Plumbers they held an Integer Overflow
Prevention BoF so this might be of interest to them:
https://lpc.events/event/18/contributions/1872/

Thanks,

Lukas

-- >8 --
Subject: [PATCH] treewide: Harden against integer overflows in DIV_ROUND_UP()

Herbert Xu notes that DIV_ROUND_UP() may overflow unnecessarily and
instead suggests (for a division by 8):

  X / 8 + !!(X & 7)

Based on this formula, a generic DIV_ROUND_UP_POW2() macro has just been
introduced.  Use it in DIV_ROUND_UP() for any constant divisor which is
a power of 2.

Convert all occurrences of DIV_ROUND_UP_POW2() in the crypto subsystem
to DIV_ROUND_UP(), which will internally expand to DIV_ROUND_UP_POW2().

Unfortunately wherever DIV_ROUND_UP() is used to size an array, gcc will
now raise errors such as:

  include/linux/tcp.h:91:17: error: variably modified 'val' at file scope
  __le64  val[DIV_ROUND_UP(TCP_FASTOPEN_COOKIE_MAX, sizeof(u64))];

It seems gcc does not lower the more complex DIV_ROUND_UP() macro before
determining whether an array is variably sized.  Work around by using
__KERNEL_DIV_ROUND_UP() in lieu of DIV_ROUND_UP() wherever it's used
to size arrays.  Same for initializers of static variables.

Link: https://lore.kernel.org/r/Z3iElsILmoSu6FuC@gondor.apana.org.au/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 arch/arm/include/asm/kprobes.h                |  3 +-
 arch/arm64/include/asm/fixmap.h               |  3 +-
 arch/arm64/kernel/ptrace.c                    | 14 ++++----
 arch/loongarch/include/asm/bootinfo.h         |  2 +-
 arch/x86/kernel/espfix_64.c                   |  3 +-
 arch/x86/kvm/hyperv.c                         |  3 +-
 crypto/ecc.c                                  |  2 +-
 crypto/ecdsa-p1363.c                          |  9 +++--
 crypto/ecdsa-x962.c                           |  7 ++--
 crypto/sig.c                                  |  2 +-
 drivers/accel/qaic/sahara.c                   |  5 +--
 drivers/cdx/controller/mcdi.h                 |  3 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  2 +-
 drivers/crypto/sa2ul.h                        |  3 +-
 drivers/firewire/ohci.c                       |  5 +--
 drivers/fpga/ice40-spi.c                      |  2 +-
 drivers/fpga/intel-m10-bmc-sec-update.c       |  2 +-
 drivers/gpio/gpio-graniterapids.c             |  2 +-
 drivers/gpio/gpio-stmpe.c                     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h          |  2 +-
 drivers/gpu/drm/i915/i915_perf_types.h        |  2 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h |  2 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c  | 34 +++++++++++--------
 drivers/input/rmi4/rmi_f30.c                  |  2 +-
 drivers/input/rmi4/rmi_f3a.c                  |  3 +-
 drivers/irqchip/irq-gic.c                     |  8 ++---
 drivers/irqchip/irq-mst-intc.c                |  2 +-
 drivers/media/firewire/firedtv-fw.c           |  3 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  4 +--
 drivers/media/pci/pt3/pt3.h                   |  2 +-
 drivers/media/platform/nxp/dw100/dw100.c      |  4 +--
 drivers/mfd/twl4030-irq.c                     |  4 +--
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c    |  5 ++-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  3 +-
 drivers/net/ethernet/cisco/enic/vnic_rq.h     |  2 +-
 drivers/net/ethernet/cisco/enic/vnic_wq.h     |  2 +-
 drivers/net/ethernet/google/gve/gve.h         |  3 +-
 .../hisilicon/hns3/hns3pf/hclge_main.h        |  2 +-
 drivers/net/ethernet/meta/fbnic/fbnic_csr.h   |  4 +--
 drivers/net/ethernet/qlogic/qed/qed_debug.c   |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c      |  2 +-
 drivers/net/ethernet/sfc/mcdi.h               |  4 +--
 drivers/net/ethernet/sfc/siena/mcdi.h         |  4 +--
 drivers/net/ethernet/sfc/siena/ptp.c          |  2 +-
 drivers/net/ethernet/ti/cpsw_ale.h            |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  4 +--
 .../wireless/mediatek/mt76/mt76x0/eeprom.c    |  2 +-
 drivers/perf/arm-cmn.c                        |  2 +-
 drivers/scsi/fnic/vnic_rq.h                   |  2 +-
 drivers/scsi/fnic/vnic_wq.h                   |  2 +-
 drivers/scsi/snic/vnic_wq.h                   |  4 +--
 drivers/xen/xenbus/xenbus_client.c            |  3 +-
 fs/ceph/crypto.h                              |  2 +-
 fs/ceph/mds_client.c                          |  3 +-
 fs/erofs/decompressor.c                       |  6 ++--
 fs/exfat/exfat_fs.h                           |  5 +--
 fs/nfs/nfs42proc.c                            |  2 +-
 fs/nfs/nfs4proc.c                             |  2 +-
 fs/nfs/nfs4session.h                          |  2 +-
 fs/orangefs/orangefs-bufmap.c                 |  2 +-
 include/crypto/internal/ecc.h                 |  2 +-
 include/linux/can/length.h                    |  5 ++-
 include/linux/gpio/gpio-nomadik.h             |  2 +-
 include/linux/math.h                          |  6 +++-
 include/linux/mmzone.h                        |  3 +-
 include/linux/nfs4.h                          |  3 +-
 include/linux/rcu_node_tree.h                 | 12 +++----
 include/linux/tcp.h                           |  2 +-
 include/net/cfg80211.h                        |  2 +-
 kernel/events/core.c                          |  2 +-
 kernel/power/swap.c                           |  4 +--
 kernel/rcu/tasks.h                            |  2 +-
 lib/bch.c                                     |  2 +-
 lib/test_bitmap.c                             |  7 ++--
 mm/zsmalloc.c                                 |  5 +--
 net/ethtool/bitset.c                          |  2 +-
 net/ethtool/common.h                          |  2 +-
 net/ethtool/ioctl.c                           |  2 +-
 net/mac80211/airtime.c                        |  2 +-
 net/mac80211/rc80211_minstrel_ht.c            |  2 +-
 security/selinux/ss/sidtab.h                  |  5 +--
 sound/usb/misc/ua101.c                        |  2 +-
 85 files changed, 165 insertions(+), 143 deletions(-)

diff --git a/arch/arm/include/asm/kprobes.h b/arch/arm/include/asm/kprobes.h
index 5b8dbf1b0be4..5ea8ba6246f4 100644
--- a/arch/arm/include/asm/kprobes.h
+++ b/arch/arm/include/asm/kprobes.h
@@ -63,7 +63,8 @@ struct arch_optimized_insn {
 	 * copy of the original instructions.
 	 * Different from x86, ARM kprobe_opcode_t is u32.
 	 */
-#define MAX_COPIED_INSN	DIV_ROUND_UP(RELATIVEJUMP_SIZE, sizeof(kprobe_opcode_t))
+#define MAX_COPIED_INSN	__KERNEL_DIV_ROUND_UP(RELATIVEJUMP_SIZE, \
+					      sizeof(kprobe_opcode_t))
 	kprobe_opcode_t copied_insn[MAX_COPIED_INSN];
 	/* detour code buffer */
 	kprobe_opcode_t *insn;
diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 87e307804b99..7043733dc240 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -43,7 +43,8 @@ enum fixed_addresses {
 	 * whether it crosses any page boundary.
 	 */
 	FIX_FDT_END,
-	FIX_FDT = FIX_FDT_END + DIV_ROUND_UP(MAX_FDT_SIZE, PAGE_SIZE) + 1,
+	FIX_FDT = FIX_FDT_END + __KERNEL_DIV_ROUND_UP(MAX_FDT_SIZE, PAGE_SIZE)
+		  + 1,
 
 	FIX_EARLYCON_MEM_BASE,
 	FIX_TEXT_POKE0,
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f79b0d5f71ac..48c0eae2afbd 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1654,9 +1654,9 @@ static const struct user_regset aarch64_regsets[] = {
 #ifdef CONFIG_ARM64_SVE
 	[REGSET_SVE] = { /* Scalable Vector Extension */
 		.core_note_type = NT_ARM_SVE,
-		.n = DIV_ROUND_UP(SVE_PT_SIZE(ARCH_SVE_VQ_MAX,
-					      SVE_PT_REGS_SVE),
-				  SVE_VQ_BYTES),
+		.n = __KERNEL_DIV_ROUND_UP(SVE_PT_SIZE(ARCH_SVE_VQ_MAX,
+						       SVE_PT_REGS_SVE),
+					   SVE_VQ_BYTES),
 		.size = SVE_VQ_BYTES,
 		.align = SVE_VQ_BYTES,
 		.regset_get = sve_get,
@@ -1666,8 +1666,9 @@ static const struct user_regset aarch64_regsets[] = {
 #ifdef CONFIG_ARM64_SME
 	[REGSET_SSVE] = { /* Streaming mode SVE */
 		.core_note_type = NT_ARM_SSVE,
-		.n = DIV_ROUND_UP(SVE_PT_SIZE(SME_VQ_MAX, SVE_PT_REGS_SVE),
-				  SVE_VQ_BYTES),
+		.n = __KERNEL_DIV_ROUND_UP(SVE_PT_SIZE(SME_VQ_MAX,
+						       SVE_PT_REGS_SVE),
+					   SVE_VQ_BYTES),
 		.size = SVE_VQ_BYTES,
 		.align = SVE_VQ_BYTES,
 		.regset_get = ssve_get,
@@ -1683,7 +1684,8 @@ static const struct user_regset aarch64_regsets[] = {
 		 * registers. These values aren't exposed to
 		 * userspace.
 		 */
-		.n = DIV_ROUND_UP(ZA_PT_SIZE(SME_VQ_MAX), SVE_VQ_BYTES),
+		.n = __KERNEL_DIV_ROUND_UP(ZA_PT_SIZE(SME_VQ_MAX),
+					   SVE_VQ_BYTES),
 		.size = SVE_VQ_BYTES,
 		.align = SVE_VQ_BYTES,
 		.regset_get = za_get,
diff --git a/arch/loongarch/include/asm/bootinfo.h b/arch/loongarch/include/asm/bootinfo.h
index 7657e016233f..8b7846bdd985 100644
--- a/arch/loongarch/include/asm/bootinfo.h
+++ b/arch/loongarch/include/asm/bootinfo.h
@@ -24,7 +24,7 @@ struct loongson_board_info {
 	const char *board_vendor;
 };
 
-#define NR_WORDS DIV_ROUND_UP(NR_CPUS, BITS_PER_LONG)
+#define NR_WORDS BITS_TO_LONGS(NR_CPUS)
 
 /*
  * The "core" of cores_per_node and cores_per_package stands for a
diff --git a/arch/x86/kernel/espfix_64.c b/arch/x86/kernel/espfix_64.c
index 6726e0473d0b..4515817cec09 100644
--- a/arch/x86/kernel/espfix_64.c
+++ b/arch/x86/kernel/espfix_64.c
@@ -59,7 +59,8 @@ DEFINE_PER_CPU_READ_MOSTLY(unsigned long, espfix_waddr);
 static DEFINE_MUTEX(espfix_init_mutex);
 
 /* Page allocation bitmap - each page serves ESPFIX_STACKS_PER_PAGE CPUs */
-#define ESPFIX_MAX_PAGES  DIV_ROUND_UP(CONFIG_NR_CPUS, ESPFIX_STACKS_PER_PAGE)
+#define ESPFIX_MAX_PAGES	\
+	__KERNEL_DIV_ROUND_UP(CONFIG_NR_CPUS, ESPFIX_STACKS_PER_PAGE)
 static void *espfix_pages[ESPFIX_MAX_PAGES];
 
 static __page_aligned_bss pud_t espfix_pud_page[PTRS_PER_PUD]
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 6a6dd5a84f22..771c97953d38 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -42,7 +42,8 @@
 #include "irq.h"
 #include "fpu.h"
 
-#define KVM_HV_MAX_SPARSE_VCPU_SET_BITS DIV_ROUND_UP(KVM_MAX_VCPUS, HV_VCPUS_PER_SPARSE_BANK)
+#define KVM_HV_MAX_SPARSE_VCPU_SET_BITS \
+	__KERNEL_DIV_ROUND_UP(KVM_MAX_VCPUS, HV_VCPUS_PER_SPARSE_BANK)
 
 /*
  * As per Hyper-V TLFS, extended hypercalls start from 0x8001
diff --git a/crypto/ecc.c b/crypto/ecc.c
index 6cf9a945fc6c..50ad2d4ed672 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -71,7 +71,7 @@ EXPORT_SYMBOL(ecc_get_curve);
 void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 			   u64 *out, unsigned int ndigits)
 {
-	int diff = ndigits - DIV_ROUND_UP_POW2(nbytes, sizeof(u64));
+	int diff = ndigits - DIV_ROUND_UP(nbytes, sizeof(u64));
 	unsigned int o = nbytes & 7;
 	__be64 msd = 0;
 
diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
index e0c55c64711c..d668d816d16c 100644
--- a/crypto/ecdsa-p1363.c
+++ b/crypto/ecdsa-p1363.c
@@ -21,9 +21,9 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
 			      const void *digest, unsigned int dlen)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
-	unsigned int keylen = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
-						BITS_PER_BYTE);
-	unsigned int ndigits = DIV_ROUND_UP_POW2(keylen, sizeof(u64));
+	unsigned int keylen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child),
+					   BITS_PER_BYTE);
+	unsigned int ndigits = DIV_ROUND_UP(keylen, sizeof(u64));
 	struct ecdsa_raw_sig sig;
 
 	if (slen != 2 * keylen)
@@ -46,8 +46,7 @@ static unsigned int ecdsa_p1363_max_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return 2 * DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
-				     BITS_PER_BYTE);
+	return 2 * DIV_ROUND_UP(crypto_sig_keysize(ctx->child), BITS_PER_BYTE);
 }
 
 static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index ee71594d10a0..73d4f3e2e5a6 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -81,8 +81,8 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 	struct ecdsa_x962_signature_ctx sig_ctx;
 	int err;
 
-	sig_ctx.ndigits = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
-					    sizeof(u64) * BITS_PER_BYTE);
+	sig_ctx.ndigits = DIV_ROUND_UP(crypto_sig_keysize(ctx->child),
+				       sizeof(u64) * BITS_PER_BYTE);
 
 	err = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, slen);
 	if (err < 0)
@@ -103,8 +103,7 @@ static unsigned int ecdsa_x962_max_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
 	struct sig_alg *alg = crypto_sig_alg(ctx->child);
-	int slen = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
-				     BITS_PER_BYTE);
+	int slen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), BITS_PER_BYTE);
 
 	/*
 	 * Verify takes ECDSA-Sig-Value (described in RFC 5480) as input,
diff --git a/crypto/sig.c b/crypto/sig.c
index 53a3dd6fbe3f..c0b8017b40c3 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -104,7 +104,7 @@ static int sig_default_set_key(struct crypto_sig *tfm,
 
 static unsigned int sig_default_size(struct crypto_sig *tfm)
 {
-	return DIV_ROUND_UP_POW2(crypto_sig_keysize(tfm), BITS_PER_BYTE);
+	return DIV_ROUND_UP(crypto_sig_keysize(tfm), BITS_PER_BYTE);
 }
 
 static int sig_prepare_alg(struct sig_alg *alg)
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 21d58aed0deb..98fef467897f 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -39,8 +39,9 @@
 #define SAHARA_PACKET_MAX_SIZE		0xffffU /* MHI_MAX_MTU */
 #define SAHARA_TRANSFER_MAX_SIZE	0x80000
 #define SAHARA_READ_MAX_SIZE		0xfff0U /* Avoid unaligned requests */
-#define SAHARA_NUM_TX_BUF		DIV_ROUND_UP(SAHARA_TRANSFER_MAX_SIZE,\
-							SAHARA_PACKET_MAX_SIZE)
+#define SAHARA_NUM_TX_BUF		__KERNEL_DIV_ROUND_UP(		      \
+						    SAHARA_TRANSFER_MAX_SIZE, \
+						    SAHARA_PACKET_MAX_SIZE)
 #define SAHARA_IMAGE_ID_NONE		U32_MAX
 
 #define SAHARA_VERSION			2
diff --git a/drivers/cdx/controller/mcdi.h b/drivers/cdx/controller/mcdi.h
index 54a65e9760ae..574f1e358107 100644
--- a/drivers/cdx/controller/mcdi.h
+++ b/drivers/cdx/controller/mcdi.h
@@ -204,7 +204,8 @@ int cdx_mcdi_wait_for_quiescence(struct cdx_mcdi *cdx,
  * are appropriately aligned, but 64-bit fields are only
  * 32-bit-aligned.
  */
-#define MCDI_DECLARE_BUF(_name, _len) struct cdx_dword _name[DIV_ROUND_UP(_len, 4)] = {{0}}
+#define MCDI_DECLARE_BUF(_name, _len)					\
+	struct cdx_dword _name[__KERNEL_DIV_ROUND_UP(_len, 4)] = {{0}}
 #define _MCDI_PTR(_buf, _offset)					\
 	((u8 *)(_buf) + (_offset))
 #define MCDI_PTR(_buf, _field)						\
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 3b5c2af013d0..0be685af435d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -97,7 +97,7 @@
 #define ESR_D1	5
 
 #define PRNG_DATA_SIZE (160 / 8)
-#define PRNG_SEED_SIZE DIV_ROUND_UP(175, 8)
+#define PRNG_SEED_SIZE __KERNEL_DIV_ROUND_UP(175, 8)
 #define PRNG_LD BIT(17)
 
 #define CE_DIE_ID_SHIFT	16
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index ae66eb45fb24..7cd10b176591 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -80,7 +80,7 @@
 #define SS_DIE_ID_MASK	0x07
 
 #define PRNG_DATA_SIZE (160 / 8)
-#define PRNG_SEED_SIZE DIV_ROUND_UP(175, 8)
+#define PRNG_SEED_SIZE __KERNEL_DIV_ROUND_UP(175, 8)
 
 #define MAX_PAD_SIZE 4096
 
diff --git a/drivers/crypto/sa2ul.h b/drivers/crypto/sa2ul.h
index 12c17a68d350..94c53d204e6c 100644
--- a/drivers/crypto/sa2ul.h
+++ b/drivers/crypto/sa2ul.h
@@ -202,8 +202,7 @@ struct sa_crypto_data {
 	u16		sc_id_start;
 	u16		sc_id_end;
 	u16		sc_id;
-	unsigned long	ctx_bm[DIV_ROUND_UP(SA_MAX_NUM_CTX,
-				BITS_PER_LONG)];
+	unsigned long	ctx_bm[BITS_TO_LONGS(SA_MAX_NUM_CTX)];
 	struct sa_tfm_ctx	*ctx;
 	struct dma_chan		*dma_rx1;
 	struct dma_chan		*dma_rx2;
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index edaedd156a6d..ca13e7d232db 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -84,13 +84,14 @@ struct descriptor {
 #define CONTEXT_MATCH(regs)	((regs) + 16)
 
 #define AR_BUFFER_SIZE	(32*1024)
-#define AR_BUFFERS_MIN	DIV_ROUND_UP(AR_BUFFER_SIZE, PAGE_SIZE)
+#define AR_BUFFERS_MIN	__KERNEL_DIV_ROUND_UP(AR_BUFFER_SIZE, PAGE_SIZE)
 /* we need at least two pages for proper list management */
 #define AR_BUFFERS	(AR_BUFFERS_MIN >= 2 ? AR_BUFFERS_MIN : 2)
 
 #define MAX_ASYNC_PAYLOAD	4096
 #define MAX_AR_PACKET_SIZE	(16 + MAX_ASYNC_PAYLOAD + 4)
-#define AR_WRAPAROUND_PAGES	DIV_ROUND_UP(MAX_AR_PACKET_SIZE, PAGE_SIZE)
+#define AR_WRAPAROUND_PAGES	__KERNEL_DIV_ROUND_UP(MAX_AR_PACKET_SIZE, \
+						      PAGE_SIZE)
 
 struct ar_context {
 	struct fw_ohci *ohci;
diff --git a/drivers/fpga/ice40-spi.c b/drivers/fpga/ice40-spi.c
index 62c30266130d..3698fd0e5d4f 100644
--- a/drivers/fpga/ice40-spi.c
+++ b/drivers/fpga/ice40-spi.c
@@ -21,7 +21,7 @@
 #define ICE40_SPI_RESET_DELAY 1 /* us (>200ns) */
 #define ICE40_SPI_HOUSEKEEPING_DELAY 1200 /* us */
 
-#define ICE40_SPI_NUM_ACTIVATION_BYTES DIV_ROUND_UP(49, 8)
+#define ICE40_SPI_NUM_ACTIVATION_BYTES __KERNEL_DIV_ROUND_UP(49, 8)
 
 struct ice40_fpga_priv {
 	struct spi_device *dev;
diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
index 10f678b9ed36..9ab58c35ede3 100644
--- a/drivers/fpga/intel-m10-bmc-sec-update.c
+++ b/drivers/fpga/intel-m10-bmc-sec-update.c
@@ -160,7 +160,7 @@ DEVICE_ATTR_SEC_REH_RO(sr);
 DEVICE_ATTR_SEC_REH_RO(pr);
 
 #define CSK_BIT_LEN		128U
-#define CSK_32ARRAY_SIZE	DIV_ROUND_UP(CSK_BIT_LEN, 32)
+#define CSK_32ARRAY_SIZE	__KERNEL_DIV_ROUND_UP(CSK_BIT_LEN, 32)
 
 static ssize_t
 show_canceled_csk(struct device *dev, u32 addr, char *buf)
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index ad6a045fd3d2..98eb705d7f05 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -30,7 +30,7 @@
 
 #define GNR_NUM_PINS 128
 #define GNR_PINS_PER_REG 32
-#define GNR_NUM_REGS DIV_ROUND_UP(GNR_NUM_PINS, GNR_PINS_PER_REG)
+#define GNR_NUM_REGS __KERNEL_DIV_ROUND_UP(GNR_NUM_PINS, GNR_PINS_PER_REG)
 
 #define GNR_CFG_PADBAR		0x00
 #define GNR_CFG_LOCK_OFFSET	0x04
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 75a3633ceddb..f820e98a87be 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -381,7 +381,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 statmsbreg;
 	int num_banks = DIV_ROUND_UP(stmpe->num_gpios, 8);
-	u8 status[DIV_ROUND_UP(MAX_GPIOS, 8)];
+	u8 status[__KERNEL_DIV_ROUND_UP(MAX_GPIOS, 8)];
 	int ret;
 	int i;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 69895fccb474..5fe7464d340a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -516,7 +516,7 @@ struct amdgpu_wb {
 	volatile uint32_t	*wb;
 	uint64_t		gpu_addr;
 	u32			num_wb;	/* Number of wb slots actually reserved for amdgpu. */
-	unsigned long		used[DIV_ROUND_UP(AMDGPU_MAX_WB, BITS_PER_LONG)];
+	unsigned long		used[BITS_TO_LONGS(AMDGPU_MAX_WB)];
 	spinlock_t		lock;
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index d7e8c374f153..c653805b32e2 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -45,7 +45,7 @@ struct drm_printer;
 #define GEN_SS_MASK_SIZE		SSEU_MAX(I915_MAX_SS_FUSE_BITS, \
 						 GEN_MAX_HSW_SLICES * GEN_MAX_SS_PER_HSW_SLICE)
 
-#define GEN_SSEU_STRIDE(max_entries)	DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
+#define GEN_SSEU_STRIDE(max_entries)	BITS_TO_BYTES(max_entries)
 #define GEN_MAX_SUBSLICE_STRIDE		GEN_SSEU_STRIDE(GEN_SS_MASK_SIZE)
 #define GEN_MAX_EU_STRIDE		GEN_SSEU_STRIDE(GEN_MAX_EUS_PER_SS)
 
diff --git a/drivers/gpu/drm/i915/i915_perf_types.h b/drivers/gpu/drm/i915/i915_perf_types.h
index 39fb6ce4a7ef..ba02c7c64bfb 100644
--- a/drivers/gpu/drm/i915/i915_perf_types.h
+++ b/drivers/gpu/drm/i915/i915_perf_types.h
@@ -502,7 +502,7 @@ struct i915_perf {
 	 * Use a format mask to store the supported formats
 	 * for a platform.
 	 */
-#define FORMAT_MASK_SIZE DIV_ROUND_UP(I915_OA_FORMAT_MAX - 1, BITS_PER_LONG)
+#define FORMAT_MASK_SIZE BITS_TO_LONGS(I915_OA_FORMAT_MAX - 1)
 	unsigned long format_mask[FORMAT_MASK_SIZE];
 
 	atomic64_t noa_programming_delay;
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.h b/drivers/gpu/drm/imagination/pvr_fw_mips.h
index a0c5c41c8aa2..e6a17989bd1b 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -13,7 +13,7 @@
 /* Forward declaration from pvr_gem.h. */
 struct pvr_gem_object;
 
-#define PVR_MIPS_PT_PAGE_COUNT DIV_ROUND_UP(ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K, PAGE_SIZE)
+#define PVR_MIPS_PT_PAGE_COUNT __KERNEL_DIV_ROUND_UP(ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K, PAGE_SIZE)
 
 /**
  * struct pvr_fw_mips_data - MIPS-specific data
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
index 5cfa2bb7ad93..c693f34ee52e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
@@ -89,7 +89,7 @@ struct rcar_du_device_info {
 };
 
 #define RCAR_DU_MAX_CRTCS		4
-#define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
+#define RCAR_DU_MAX_GROUPS		__KERNEL_DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
 #define RCAR_DU_MAX_VSPS		4
 #define RCAR_DU_MAX_LVDS		2
 #define RCAR_DU_MAX_DSI			2
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 6ea04cc8f324..9c8b6a7d6dbc 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -215,35 +215,36 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 },
 { .buffer_created = 1, .name = "YVU420 Max sizes",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
-		 .handles = { 1, 1, 1 }, .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2),
-						      DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .handles = { 1, 1, 1 }, .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+						      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 0, .name = "YVU420 Invalid pitch",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
-		 .handles = { 1, 1, 1 }, .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2) - 1,
-						      DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .handles = { 1, 1, 1 }, .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) - 1,
+						      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 1, .name = "YVU420 Different pitches",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
-		 .handles = { 1, 1, 1 }, .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2) + 1,
-						      DIV_ROUND_UP(MAX_WIDTH, 2) + 7 },
+		 .handles = { 1, 1, 1 }, .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) + 1,
+						      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) + 7 },
 	}
 },
 { .buffer_created = 1, .name = "YVU420 Different buffer offsets/pitches",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .offsets = { MAX_WIDTH, MAX_WIDTH  +
 			 MAX_WIDTH * MAX_HEIGHT, MAX_WIDTH  + 2 * MAX_WIDTH * MAX_HEIGHT },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2) + 1,
-			 DIV_ROUND_UP(MAX_WIDTH, 2) + 7 },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) + 1,
+			 __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) + 7 },
 	}
 },
 { .buffer_created = 0,
 	.name = "YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS",
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .modifier = { AFBC_FORMAT_MOD_SPARSE, 0, 0 },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+			      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 0,
@@ -251,7 +252,8 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 },
 		 .modifier = { AFBC_FORMAT_MOD_SPARSE, AFBC_FORMAT_MOD_SPARSE, 0 },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+			      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 0,
@@ -259,7 +261,8 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
 		 .modifier = { AFBC_FORMAT_MOD_SPARSE, AFBC_FORMAT_MOD_SPARSE, 0 },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+			      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 1, .name = "YVU420 Valid modifier",
@@ -267,7 +270,8 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
 		 .modifier = { AFBC_FORMAT_MOD_SPARSE, AFBC_FORMAT_MOD_SPARSE,
 			 AFBC_FORMAT_MOD_SPARSE },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+			      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 0, .name = "YVU420 Different modifiers per plane",
@@ -275,7 +279,8 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
 		 .modifier = { AFBC_FORMAT_MOD_SPARSE, AFBC_FORMAT_MOD_SPARSE | AFBC_FORMAT_MOD_YTR,
 			       AFBC_FORMAT_MOD_SPARSE },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+			      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 0, .name = "YVU420 Modifier for inexistent plane",
@@ -283,7 +288,8 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
 		 .modifier = { AFBC_FORMAT_MOD_SPARSE, AFBC_FORMAT_MOD_SPARSE,
 			 AFBC_FORMAT_MOD_SPARSE, AFBC_FORMAT_MOD_SPARSE },
-		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
+		 .pitches = { MAX_WIDTH, __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2),
+			      __KERNEL_DIV_ROUND_UP(MAX_WIDTH, 2) },
 	}
 },
 { .buffer_created = 0, .name = "YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)",
diff --git a/drivers/input/rmi4/rmi_f30.c b/drivers/input/rmi4/rmi_f30.c
index 35045f161dc2..02a8aaf5fa3a 100644
--- a/drivers/input/rmi4/rmi_f30.c
+++ b/drivers/input/rmi4/rmi_f30.c
@@ -30,7 +30,7 @@
 #define RMI_F30_CTRL_10_NUM_MECH_MOUSE_BTNS	0x03
 
 #define RMI_F30_CTRL_MAX_REGS		32
-#define RMI_F30_CTRL_MAX_BYTES		DIV_ROUND_UP(RMI_F30_CTRL_MAX_REGS, 8)
+#define RMI_F30_CTRL_MAX_BYTES		BITS_TO_BYTES(RMI_F30_CTRL_MAX_REGS)
 #define RMI_F30_CTRL_MAX_REG_BLOCKS	11
 
 #define RMI_F30_CTRL_REGS_MAX_SIZE (RMI_F30_CTRL_MAX_BYTES		\
diff --git a/drivers/input/rmi4/rmi_f3a.c b/drivers/input/rmi4/rmi_f3a.c
index 0e8baed84dbb..34a6c511f95d 100644
--- a/drivers/input/rmi4/rmi_f3a.c
+++ b/drivers/input/rmi4/rmi_f3a.c
@@ -10,7 +10,8 @@
 #include "rmi_driver.h"
 
 #define RMI_F3A_MAX_GPIO_COUNT		128
-#define RMI_F3A_MAX_REG_SIZE		DIV_ROUND_UP(RMI_F3A_MAX_GPIO_COUNT, 8)
+#define RMI_F3A_MAX_REG_SIZE		__KERNEL_DIV_ROUND_UP(		      \
+						     RMI_F3A_MAX_GPIO_COUNT, 8)
 
 /* Defs for Query 0 */
 #define RMI_F3A_GPIO_COUNT		0x7F
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 6503573557fd..b24445c9bc86 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -74,10 +74,10 @@ struct gic_chip_data {
 	void __iomem *raw_cpu_base;
 	u32 percpu_offset;
 #if defined(CONFIG_CPU_PM) || defined(CONFIG_ARM_GIC_PM)
-	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
-	u32 saved_spi_active[DIV_ROUND_UP(1020, 32)];
-	u32 saved_spi_conf[DIV_ROUND_UP(1020, 16)];
-	u32 saved_spi_target[DIV_ROUND_UP(1020, 4)];
+	u32 saved_spi_enable[__KERNEL_DIV_ROUND_UP(1020, 32)];
+	u32 saved_spi_active[__KERNEL_DIV_ROUND_UP(1020, 32)];
+	u32 saved_spi_conf[__KERNEL_DIV_ROUND_UP(1020, 16)];
+	u32 saved_spi_target[__KERNEL_DIV_ROUND_UP(1020, 4)];
 	u32 __percpu *saved_ppi_enable;
 	u32 __percpu *saved_ppi_active;
 	u32 __percpu *saved_ppi_conf;
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index f6133ae28155..2c03aad7fc15 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -32,7 +32,7 @@ struct mst_intc_chip_data {
 	bool		no_eoi;
 #ifdef CONFIG_PM_SLEEP
 	struct list_head entry;
-	u16 saved_polarity_conf[DIV_ROUND_UP(MST_INTC_MAX_IRQS, 16)];
+	u16 saved_polarity_conf[__KERNEL_DIV_ROUND_UP(MST_INTC_MAX_IRQS, 16)];
 #endif
 };
 
diff --git a/drivers/media/firewire/firedtv-fw.c b/drivers/media/firewire/firedtv-fw.c
index 5f6e97a8d1c0..f952e8ba0878 100644
--- a/drivers/media/firewire/firedtv-fw.c
+++ b/drivers/media/firewire/firedtv-fw.c
@@ -71,7 +71,8 @@ int fdtv_write(struct firedtv *fdtv, u64 addr, void *data, size_t len)
 #define MAX_PACKET_SIZE		1024  /* 776, rounded up to 2^n */
 #define PACKETS_PER_PAGE	(PAGE_SIZE / MAX_PACKET_SIZE)
 #define N_PACKETS		64    /* buffer size */
-#define N_PAGES			DIV_ROUND_UP(N_PACKETS, PACKETS_PER_PAGE)
+#define N_PAGES			__KERNEL_DIV_ROUND_UP(N_PACKETS, \
+						      PACKETS_PER_PAGE)
 #define IRQ_INTERVAL		16
 
 struct fdtv_ir_context {
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index dd73d534ac49..1ba4d9004373 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -350,8 +350,8 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	static const int NUM_VCS = 4;
 	static const int SID;	/* Stream id */
 	static const int ENTRY;
-	static const int FBPT_WIDTH = DIV_ROUND_UP(CIO2_MAX_LOPS,
-					CIO2_FBPT_SUBENTRY_UNIT);
+	static const int FBPT_WIDTH = __KERNEL_DIV_ROUND_UP(CIO2_MAX_LOPS,
+						 CIO2_FBPT_SUBENTRY_UNIT);
 	const u32 num_buffers1 = CIO2_MAX_BUFFERS - 1;
 	const struct ipu3_cio2_fmt *fmt;
 	void __iomem *const base = cio2->base;
diff --git a/drivers/media/pci/pt3/pt3.h b/drivers/media/pci/pt3/pt3.h
index a53124438f51..a521eca067b6 100644
--- a/drivers/media/pci/pt3/pt3.h
+++ b/drivers/media/pci/pt3/pt3.h
@@ -66,7 +66,7 @@ struct pt3_i2cbuf {
 
 #define DESCS_IN_PAGE (PAGE_SIZE / sizeof(struct xfer_desc))
 #define MAX_NUM_XFERS (MAX_DATA_BUFS * DATA_BUF_XFERS)
-#define MAX_DESC_BUFS DIV_ROUND_UP(MAX_NUM_XFERS, DESCS_IN_PAGE)
+#define MAX_DESC_BUFS __KERNEL_DIV_ROUND_UP(MAX_NUM_XFERS, DESCS_IN_PAGE)
 
 /* DMA transfer description.
  * device is passed a pointer to this struct, dma-reads it,
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 66582e7f92fc..831db5899b5c 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -41,8 +41,8 @@
 
 #define DW100_DEF_W		640u
 #define DW100_DEF_H		480u
-#define DW100_DEF_LUT_W		(DIV_ROUND_UP(DW100_DEF_W, DW100_BLOCK_SIZE) + 1)
-#define DW100_DEF_LUT_H		(DIV_ROUND_UP(DW100_DEF_H, DW100_BLOCK_SIZE) + 1)
+#define DW100_DEF_LUT_W		(__KERNEL_DIV_ROUND_UP(DW100_DEF_W, DW100_BLOCK_SIZE) + 1)
+#define DW100_DEF_LUT_H		(__KERNEL_DIV_ROUND_UP(DW100_DEF_H, DW100_BLOCK_SIZE) + 1)
 
 /*
  * 16 controls have been reserved for this driver for future extension, but
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 87496c1cb8bc..a32c673e605a 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -82,9 +82,9 @@ static int nr_sih_modules;
 	.module		= TWL4030_MODULE_ ## modname, \
 	.control_offset = TWL4030_ ## modname ## _SIH_CTRL, \
 	.bits		= nbits, \
-	.bytes_ixr	= DIV_ROUND_UP(nbits, 8), \
+	.bytes_ixr	= BITS_TO_BYTES(nbits), \
 	.edr_offset	= TWL4030_ ## modname ## _EDR, \
-	.bytes_edr	= DIV_ROUND_UP((2*(nbits)), 8), \
+	.bytes_edr	= BITS_TO_BYTES(2*(nbits)), \
 	.irq_lines	= 2, \
 	.mask = { { \
 		.isr_offset	= TWL4030_ ## modname ## _ISR1, \
diff --git a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
index 175bf9b13058..703cdec20780 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
@@ -3155,9 +3155,8 @@ int t4_get_exprom_version(struct adapter *adap, u32 *vers)
 	struct exprom_header {
 		unsigned char hdr_arr[16];	/* must start with 0x55aa */
 		unsigned char hdr_ver[4];	/* Expansion ROM version */
-	} *hdr;
-	u32 exprom_header_buf[DIV_ROUND_UP(sizeof(struct exprom_header),
-					   sizeof(u32))];
+	} __packed *hdr;
+	u32 exprom_header_buf[sizeof(struct exprom_header) / sizeof(u32)];
 	int ret;
 
 	ret = t4_read_flash(adap, FLASH_EXP_ROM_START,
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 5b1d746e6563..f01f1fd772c5 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -111,7 +111,8 @@ enum {
 			  sizeof(struct cpl_tx_pkt_core)) / sizeof(__be64),
 	ETHTXQ_MAX_FLITS = ETHTXQ_MAX_SGL_LEN + ETHTXQ_MAX_HDR,
 
-	ETHTXQ_STOP_THRES = 1 + DIV_ROUND_UP(ETHTXQ_MAX_FLITS, TXD_PER_EQ_UNIT),
+	ETHTXQ_STOP_THRES = 1 + __KERNEL_DIV_ROUND_UP(ETHTXQ_MAX_FLITS,
+						      TXD_PER_EQ_UNIT),
 
 	/*
 	 * Max TX descriptor space we allow for an Ethernet packet to be
diff --git a/drivers/net/ethernet/cisco/enic/vnic_rq.h b/drivers/net/ethernet/cisco/enic/vnic_rq.h
index 0bc595abc03b..3882b00d397e 100644
--- a/drivers/net/ethernet/cisco/enic/vnic_rq.h
+++ b/drivers/net/ethernet/cisco/enic/vnic_rq.h
@@ -49,7 +49,7 @@ struct vnic_rq_ctrl {
 #define VNIC_RQ_BUF_BLK_SZ(entries) \
 	(VNIC_RQ_BUF_BLK_ENTRIES(entries) * sizeof(struct vnic_rq_buf))
 #define VNIC_RQ_BUF_BLKS_NEEDED(entries) \
-	DIV_ROUND_UP(entries, VNIC_RQ_BUF_BLK_ENTRIES(entries))
+	__KERNEL_DIV_ROUND_UP(entries, VNIC_RQ_BUF_BLK_ENTRIES(entries))
 #define VNIC_RQ_BUF_BLKS_MAX VNIC_RQ_BUF_BLKS_NEEDED(4096)
 
 struct vnic_rq_buf {
diff --git a/drivers/net/ethernet/cisco/enic/vnic_wq.h b/drivers/net/ethernet/cisco/enic/vnic_wq.h
index 75c526911074..daf62fb30455 100644
--- a/drivers/net/ethernet/cisco/enic/vnic_wq.h
+++ b/drivers/net/ethernet/cisco/enic/vnic_wq.h
@@ -61,7 +61,7 @@ struct vnic_wq_buf {
 #define VNIC_WQ_BUF_BLK_SZ(entries) \
 	(VNIC_WQ_BUF_BLK_ENTRIES(entries) * sizeof(struct vnic_wq_buf))
 #define VNIC_WQ_BUF_BLKS_NEEDED(entries) \
-	DIV_ROUND_UP(entries, VNIC_WQ_BUF_BLK_ENTRIES(entries))
+	__KERNEL_DIV_ROUND_UP(entries, VNIC_WQ_BUF_BLK_ENTRIES(entries))
 #define VNIC_WQ_BUF_BLKS_MAX VNIC_WQ_BUF_BLKS_NEEDED(4096)
 
 struct vnic_wq {
diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index 8167cc5fb0df..a5caf9e35bdf 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -84,7 +84,8 @@
 /* 2K buffers for DQO-QPL */
 #define GVE_TX_BUF_SIZE_DQO BIT(GVE_TX_BUF_SHIFT_DQO)
 #define GVE_TX_BUFS_PER_PAGE_DQO (PAGE_SIZE >> GVE_TX_BUF_SHIFT_DQO)
-#define GVE_MAX_TX_BUFS_PER_PKT (DIV_ROUND_UP(GVE_DQO_TX_MAX, GVE_TX_BUF_SIZE_DQO))
+#define GVE_MAX_TX_BUFS_PER_PKT (__KERNEL_DIV_ROUND_UP(GVE_DQO_TX_MAX, \
+						       GVE_TX_BUF_SIZE_DQO))
 
 /* If number of free/recyclable buffers are less than this threshold; driver
  * allocs and uses a non-qpl page on the receive path of DQO QPL to free
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
index b9fc719880bb..4be5d7f11e97 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
@@ -637,7 +637,7 @@ struct key_info {
 };
 
 #define MAX_KEY_LENGTH	400
-#define MAX_KEY_DWORDS	DIV_ROUND_UP(MAX_KEY_LENGTH / 8, 4)
+#define MAX_KEY_DWORDS	__KERNEL_DIV_ROUND_UP(MAX_KEY_LENGTH / 8, 4)
 #define MAX_KEY_BYTES	(MAX_KEY_DWORDS * 4)
 #define MAX_META_DATA_LENGTH	32
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_csr.h b/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
index 02bb81b3c506..85f39bfa3557 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
@@ -628,9 +628,9 @@ enum {
 #define FBNIC_RPC_RSS_KEY(n)		(0x0840c + (n))	/* 0x21030 + 4*n */
 #define FBNIC_RPC_RSS_KEY_BIT_LEN		425
 #define FBNIC_RPC_RSS_KEY_BYTE_LEN \
-	DIV_ROUND_UP(FBNIC_RPC_RSS_KEY_BIT_LEN, 8)
+	BITS_TO_BYTES(FBNIC_RPC_RSS_KEY_BIT_LEN)
 #define FBNIC_RPC_RSS_KEY_DWORD_LEN \
-	DIV_ROUND_UP(FBNIC_RPC_RSS_KEY_BIT_LEN, 32)
+	BITS_TO_U32(FBNIC_RPC_RSS_KEY_BIT_LEN)
 #define FBNIC_RPC_RSS_KEY_LAST_IDX \
 	(FBNIC_RPC_RSS_KEY_DWORD_LEN - 1)
 #define FBNIC_RPC_RSS_KEY_LAST_MASK \
diff --git a/drivers/net/ethernet/qlogic/qed/qed_debug.c b/drivers/net/ethernet/qlogic/qed/qed_debug.c
index 464a72afb758..4de0c94e82c8 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_debug.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_debug.c
@@ -388,7 +388,7 @@ struct split_type_defs {
 
 #define BYTES_IN_DWORD			sizeof(u32)
 /* In the macros below, size and offset are specified in bits */
-#define CEIL_DWORDS(size)		DIV_ROUND_UP(size, 32)
+#define CEIL_DWORDS(size)		BITS_TO_U32(size)
 #define FIELD_BIT_OFFSET(type, field)	type ## _ ## field ## _ ## OFFSET
 #define FIELD_BIT_SIZE(type, field)	type ## _ ## field ## _ ## SIZE
 #define FIELD_DWORD_OFFSET(type, field) \
diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index 4af56333ea49..2bb785e95f7e 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -368,7 +368,7 @@ static const struct i2c_algo_bit_data falcon_i2c_bit_operations = {
 	.getscl		= falcon_getscl,
 	.udelay		= 5,
 	/* Wait up to 50 ms for target to let us pull SCL high */
-	.timeout	= DIV_ROUND_UP(HZ, 20),
+	.timeout	= __KERNEL_DIV_ROUND_UP(HZ, 20),
 };
 
 static void falcon_push_irq_moderation(struct ef4_channel *channel)
diff --git a/drivers/net/ethernet/sfc/mcdi.h b/drivers/net/ethernet/sfc/mcdi.h
index cdb17d7c147f..748b7f095090 100644
--- a/drivers/net/ethernet/sfc/mcdi.h
+++ b/drivers/net/ethernet/sfc/mcdi.h
@@ -182,9 +182,9 @@ void efx_mcdi_sensor_event(struct efx_nic *efx, efx_qword_t *ev);
  * 32-bit-aligned.  Also, on Siena we must copy to the MC shared
  * memory strictly 32 bits at a time, so add any necessary padding.
  */
-#define MCDI_TX_BUF_LEN(_len) DIV_ROUND_UP((_len), 4)
+#define MCDI_TX_BUF_LEN(_len) __KERNEL_DIV_ROUND_UP((_len), 4)
 #define _MCDI_DECLARE_BUF(_name, _len)					\
-	efx_dword_t _name[DIV_ROUND_UP(_len, 4)]
+	efx_dword_t _name[__KERNEL_DIV_ROUND_UP(_len, 4)]
 #define MCDI_DECLARE_BUF(_name, _len)					\
 	_MCDI_DECLARE_BUF(_name, _len) = {{{0}}}
 #define MCDI_DECLARE_BUF_ERR(_name)					\
diff --git a/drivers/net/ethernet/sfc/siena/mcdi.h b/drivers/net/ethernet/sfc/siena/mcdi.h
index 06f38e5e6832..55ca192ff6ef 100644
--- a/drivers/net/ethernet/sfc/siena/mcdi.h
+++ b/drivers/net/ethernet/sfc/siena/mcdi.h
@@ -192,9 +192,9 @@ void efx_siena_mcdi_sensor_event(struct efx_nic *efx, efx_qword_t *ev);
  * 32-bit-aligned.  Also, on Siena we must copy to the MC shared
  * memory strictly 32 bits at a time, so add any necessary padding.
  */
-#define MCDI_TX_BUF_LEN(_len) DIV_ROUND_UP((_len), 4)
+#define MCDI_TX_BUF_LEN(_len) __KERNEL_DIV_ROUND_UP((_len), 4)
 #define _MCDI_DECLARE_BUF(_name, _len)					\
-	efx_dword_t _name[DIV_ROUND_UP(_len, 4)]
+	efx_dword_t _name[__KERNEL_DIV_ROUND_UP(_len, 4)]
 #define MCDI_DECLARE_BUF(_name, _len)					\
 	_MCDI_DECLARE_BUF(_name, _len) = {{{0}}}
 #define MCDI_DECLARE_BUF_ERR(_name)					\
diff --git a/drivers/net/ethernet/sfc/siena/ptp.c b/drivers/net/ethernet/sfc/siena/ptp.c
index 062c77c92077..395bc99b865e 100644
--- a/drivers/net/ethernet/sfc/siena/ptp.c
+++ b/drivers/net/ethernet/sfc/siena/ptp.c
@@ -166,7 +166,7 @@ enum ptp_packet_state {
  *         whether that is of no interest.
  */
 struct efx_ptp_match {
-	u32 words[DIV_ROUND_UP(PTP_V1_UUID_LENGTH, 4)];
+	u32 words[__KERNEL_DIV_ROUND_UP(PTP_V1_UUID_LENGTH, 4)];
 	unsigned long expiry;
 	enum ptp_packet_state state;
 };
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 87b7d1b3a34a..330156ac5314 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -154,7 +154,7 @@ enum cpsw_ale_port_state {
 #define ALE_MCAST_FWD_2			3
 
 #define ALE_ENTRY_BITS		68
-#define ALE_ENTRY_WORDS	DIV_ROUND_UP(ALE_ENTRY_BITS, 32)
+#define ALE_ENTRY_WORDS		BITS_TO_U32(ALE_ENTRY_BITS)
 
 struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 132148f7b107..477af5db2451 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -729,7 +729,7 @@ struct mt76_testmode_ops {
 struct mt76_testmode_data {
 	enum mt76_testmode_state state;
 
-	u32 param_set[DIV_ROUND_UP(NUM_MT76_TM_ATTRS, 32)];
+	u32 param_set[__KERNEL_DIV_ROUND_UP(NUM_MT76_TM_ATTRS, 32)];
 	struct sk_buff *tx_skb;
 
 	u32 tx_count;
@@ -914,7 +914,7 @@ struct mt76_dev {
 	/* spinclock used to protect wcid pktid linked list */
 	spinlock_t status_lock;
 
-	u32 wcid_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
+	u32 wcid_mask[__KERNEL_DIV_ROUND_UP(MT76_N_WCIDS, 32)];
 
 	u64 vif_mask;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
index 4de45a56812d..3e2c35ef7acc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
@@ -15,7 +15,7 @@
 #include "eeprom.h"
 #include "../mt76x02_phy.h"
 
-#define MT_MAP_READS	DIV_ROUND_UP(MT_EFUSE_USAGE_MAP_SIZE, 16)
+#define MT_MAP_READS	__KERNEL_DIV_ROUND_UP(MT_EFUSE_USAGE_MAP_SIZE, 16)
 static int
 mt76x0_efuse_physical_size_check(struct mt76x02_dev *dev)
 {
diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index ef959e66db7c..906d808824b9 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -593,7 +593,7 @@ static void arm_cmn_debugfs_init(struct arm_cmn *cmn, int id) {}
 
 struct arm_cmn_hw_event {
 	struct arm_cmn_node *dn;
-	u64 dtm_idx[DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64)];
+	u64 dtm_idx[__KERNEL_DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64)];
 	s8 dtc_idx[CMN_MAX_DTCS];
 	u8 num_dns;
 	u8 dtm_offset;
diff --git a/drivers/scsi/fnic/vnic_rq.h b/drivers/scsi/fnic/vnic_rq.h
index 1066255de808..e0bc651f78c0 100644
--- a/drivers/scsi/fnic/vnic_rq.h
+++ b/drivers/scsi/fnic/vnic_rq.h
@@ -64,7 +64,7 @@ struct vnic_rq_ctrl {
 #define VNIC_RQ_BUF_BLK_SZ \
 	(VNIC_RQ_BUF_BLK_ENTRIES * sizeof(struct vnic_rq_buf))
 #define VNIC_RQ_BUF_BLKS_NEEDED(entries) \
-	DIV_ROUND_UP(entries, VNIC_RQ_BUF_BLK_ENTRIES)
+	__KERNEL_DIV_ROUND_UP(entries, VNIC_RQ_BUF_BLK_ENTRIES)
 #define VNIC_RQ_BUF_BLKS_MAX VNIC_RQ_BUF_BLKS_NEEDED(4096)
 
 struct vnic_rq_buf {
diff --git a/drivers/scsi/fnic/vnic_wq.h b/drivers/scsi/fnic/vnic_wq.h
index 041618e13ce2..ab0b04f6c2a7 100644
--- a/drivers/scsi/fnic/vnic_wq.h
+++ b/drivers/scsi/fnic/vnic_wq.h
@@ -69,7 +69,7 @@ struct vnic_wq_buf {
 #define VNIC_WQ_BUF_BLK_SZ \
 	(VNIC_WQ_BUF_BLK_ENTRIES * sizeof(struct vnic_wq_buf))
 #define VNIC_WQ_BUF_BLKS_NEEDED(entries) \
-	DIV_ROUND_UP(entries, VNIC_WQ_BUF_BLK_ENTRIES)
+	__KERNEL_DIV_ROUND_UP(entries, VNIC_WQ_BUF_BLK_ENTRIES)
 #define VNIC_WQ_BUF_BLKS_MAX VNIC_WQ_BUF_BLKS_NEEDED(4096)
 
 struct vnic_wq {
diff --git a/drivers/scsi/snic/vnic_wq.h b/drivers/scsi/snic/vnic_wq.h
index 1415da4b68dc..6cfe512eb2d0 100644
--- a/drivers/scsi/snic/vnic_wq.h
+++ b/drivers/scsi/snic/vnic_wq.h
@@ -52,9 +52,7 @@ struct vnic_wq_buf {
 #define VNIC_WQ_BUF_BLK_SZ \
 	(VNIC_WQ_BUF_DFLT_BLK_ENTRIES * sizeof(struct vnic_wq_buf))
 #define VNIC_WQ_BUF_BLKS_NEEDED(entries) \
-	DIV_ROUND_UP(entries, VNIC_WQ_BUF_DFLT_BLK_ENTRIES)
-#define VNIC_WQ_BUF_BLKS_NEEDED(entries) \
-	DIV_ROUND_UP(entries, VNIC_WQ_BUF_DFLT_BLK_ENTRIES)
+	__KERNEL_DIV_ROUND_UP(entries, VNIC_WQ_BUF_DFLT_BLK_ENTRIES)
 #define VNIC_WQ_BUF_BLKS_MAX VNIC_WQ_BUF_BLKS_NEEDED(4096)
 
 struct vnic_wq {
diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 51b3124b0d56..184d46b822d8 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -49,7 +49,8 @@
 
 #include "xenbus.h"
 
-#define XENBUS_PAGES(_grants)	(DIV_ROUND_UP(_grants, XEN_PFN_PER_PAGE))
+#define XENBUS_PAGES(_grants)	(__KERNEL_DIV_ROUND_UP(_grants, \
+						       XEN_PFN_PER_PAGE))
 
 #define XENBUS_MAX_RING_PAGES	(XENBUS_PAGES(XENBUS_MAX_RING_GRANTS))
 
diff --git a/fs/ceph/crypto.h b/fs/ceph/crypto.h
index d0768239a1c9..8df9c4d91993 100644
--- a/fs/ceph/crypto.h
+++ b/fs/ceph/crypto.h
@@ -89,7 +89,7 @@ static inline u32 ceph_fscrypt_auth_len(struct ceph_fscrypt_auth *fa)
  */
 #define CEPH_NOHASH_NAME_MAX (180 - SHA256_DIGEST_SIZE)
 
-#define CEPH_BASE64_CHARS(nbytes) DIV_ROUND_UP((nbytes) * 4, 3)
+#define CEPH_BASE64_CHARS(nbytes) __KERNEL_DIV_ROUND_UP((nbytes) * 4, 3)
 
 int ceph_base64_encode(const u8 *src, int srclen, char *dst);
 int ceph_base64_decode(const char *src, int srclen, u8 *dst);
diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 54b3421501e9..091386905d06 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -5010,7 +5010,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 	int i, j, err;
 	int oldstate, newstate;
 	struct ceph_mds_session *s;
-	unsigned long targets[DIV_ROUND_UP(CEPH_MAX_MDS, sizeof(unsigned long))] = {0};
+	unsigned long targets[__KERNEL_DIV_ROUND_UP(CEPH_MAX_MDS,
+						    sizeof(unsigned long))] = {0};
 	struct ceph_client *cl = mdsc->fsc->client;
 
 	doutc(cl, "new %u old %u\n", newmap->m_epoch, oldmap->m_epoch);
diff --git a/fs/erofs/decompressor.c b/fs/erofs/decompressor.c
index 2b123b070a42..4cd1390ef25e 100644
--- a/fs/erofs/decompressor.c
+++ b/fs/erofs/decompressor.c
@@ -7,7 +7,8 @@
 #include "compress.h"
 #include <linux/lz4.h>
 
-#define LZ4_MAX_DISTANCE_PAGES	(DIV_ROUND_UP(LZ4_DISTANCE_MAX, PAGE_SIZE) + 1)
+#define LZ4_MAX_DISTANCE_PAGES \
+	(__KERNEL_DIV_ROUND_UP(LZ4_DISTANCE_MAX, PAGE_SIZE) + 1)
 
 struct z_erofs_lz4_decompress_ctx {
 	struct z_erofs_decompress_req *rq;
@@ -60,8 +61,7 @@ static int z_erofs_lz4_prepare_dstpages(struct z_erofs_lz4_decompress_ctx *ctx,
 {
 	struct z_erofs_decompress_req *rq = ctx->rq;
 	struct page *availables[LZ4_MAX_DISTANCE_PAGES] = { NULL };
-	unsigned long bounced[DIV_ROUND_UP(LZ4_MAX_DISTANCE_PAGES,
-					   BITS_PER_LONG)] = { 0 };
+	unsigned long bounced[BITS_TO_LONGS(LZ4_MAX_DISTANCE_PAGES)] = { 0 };
 	unsigned int lz4_max_distance_pages =
 				EROFS_SB(rq->sb)->lz4.max_distance_pages;
 	void *kaddr = NULL;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 78be6964a8a0..f7a882cfb259 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -47,7 +47,7 @@ enum {
 #define ES_IDX_STREAM		1
 #define ES_IDX_FIRST_FILENAME	2
 #define EXFAT_FILENAME_ENTRY_NUM(name_len) \
-	DIV_ROUND_UP(name_len, EXFAT_FILE_NAME_LEN)
+	__KERNEL_DIV_ROUND_UP(name_len, EXFAT_FILE_NAME_LEN)
 #define ES_IDX_LAST_FILENAME(name_len)	\
 	(ES_IDX_FIRST_FILENAME + EXFAT_FILENAME_ENTRY_NUM(name_len) - 1)
 
@@ -147,7 +147,8 @@ enum {
  * The 608 bytes are in 3 sectors at most (even 512 Byte sector).
  */
 #define DIR_CACHE_SIZE		\
-	(DIV_ROUND_UP(EXFAT_DEN_TO_B(ES_MAX_ENTRY_NUM), SECTOR_SIZE) + 1)
+	(__KERNEL_DIV_ROUND_UP(EXFAT_DEN_TO_B(ES_MAX_ENTRY_NUM), SECTOR_SIZE) \
+	 + 1)
 
 /* Superblock flags */
 #define EXFAT_FLAGS_SHUTDOWN	1
diff --git a/fs/nfs/nfs42proc.c b/fs/nfs/nfs42proc.c
index 1924c4a2077b..25e2f52e4485 100644
--- a/fs/nfs/nfs42proc.c
+++ b/fs/nfs/nfs42proc.c
@@ -1161,7 +1161,7 @@ int nfs42_proc_clone(struct file *src_f, struct file *dst_f,
 	return err;
 }
 
-#define NFS4XATTR_MAXPAGES DIV_ROUND_UP(XATTR_SIZE_MAX, PAGE_SIZE)
+#define NFS4XATTR_MAXPAGES __KERNEL_DIV_ROUND_UP(XATTR_SIZE_MAX, PAGE_SIZE)
 
 static int _nfs42_proc_removexattr(struct inode *inode, const char *name)
 {
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index df9669d4ded7..d2c7122ecd68 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -5954,7 +5954,7 @@ static bool nfs4_server_supports_acls(const struct nfs_server *server,
  * it's OK to put sizeof(void) * (XATTR_SIZE_MAX/PAGE_SIZE) bytes on
  * the stack.
  */
-#define NFS4ACL_MAXPAGES DIV_ROUND_UP(XATTR_SIZE_MAX, PAGE_SIZE)
+#define NFS4ACL_MAXPAGES __KERNEL_DIV_ROUND_UP(XATTR_SIZE_MAX, PAGE_SIZE)
 
 int nfs4_buf_to_pages_noslab(const void *buf, size_t buflen,
 		struct page **pages)
diff --git a/fs/nfs/nfs4session.h b/fs/nfs/nfs4session.h
index 351616c61df5..5af450df4a3f 100644
--- a/fs/nfs/nfs4session.h
+++ b/fs/nfs/nfs4session.h
@@ -35,7 +35,7 @@ enum nfs4_slot_tbl_state {
 	NFS4_SLOT_TBL_DRAINING,
 };
 
-#define SLOT_TABLE_SZ DIV_ROUND_UP(NFS4_MAX_SLOT_TABLE, BITS_PER_LONG)
+#define SLOT_TABLE_SZ BITS_TO_LONGS(NFS4_MAX_SLOT_TABLE)
 struct nfs4_slot_table {
 	struct nfs4_session *session;		/* Parent session */
 	struct nfs4_slot *slots;		/* seqid per slot */
diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.c
index edcca4beb765..1bad9687ebcb 100644
--- a/fs/orangefs/orangefs-bufmap.c
+++ b/fs/orangefs/orangefs-bufmap.c
@@ -158,7 +158,7 @@ static struct orangefs_bufmap {
 	unsigned long *buffer_index_array;
 
 	/* array to track usage of buffer descriptors for readdir */
-#define N DIV_ROUND_UP(ORANGEFS_READDIR_DEFAULT_DESC_COUNT, BITS_PER_LONG)
+#define N BITS_TO_LONGS(ORANGEFS_READDIR_DEFAULT_DESC_COUNT)
 	unsigned long readdir_index_array[N];
 #undef N
 } *__orangefs_bufmap;
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index 57cd75242141..24711384ddd1 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -34,7 +34,7 @@
 #define ECC_CURVE_NIST_P256_DIGITS  4
 #define ECC_CURVE_NIST_P384_DIGITS  6
 #define ECC_CURVE_NIST_P521_DIGITS  9
-#define ECC_MAX_DIGITS              DIV_ROUND_UP(521, 64) /* NIST P521 */
+#define ECC_MAX_DIGITS __KERNEL_DIV_ROUND_UP(521, 64) /* NIST P521 */
 
 #define ECC_DIGITS_TO_BYTES_SHIFT 3
 
diff --git a/include/linux/can/length.h b/include/linux/can/length.h
index abc978b38f79..20f90c8e6eaf 100644
--- a/include/linux/can/length.h
+++ b/include/linux/can/length.h
@@ -238,9 +238,8 @@
  * (rounded up, including intermission)
  */
 #define can_frame_bytes(is_fd, is_eff, bitstuffing, data_len)	\
-	DIV_ROUND_UP(can_frame_bits(is_fd, is_eff, bitstuffing,	\
-				    true, data_len),		\
-		     BITS_PER_BYTE)
+	BITS_TO_BYTES(can_frame_bits(is_fd, is_eff, bitstuffing,\
+				     true, data_len))
 
 /*
  * Maximum size of a Classical CAN frame
diff --git a/include/linux/gpio/gpio-nomadik.h b/include/linux/gpio/gpio-nomadik.h
index b5a84864650d..067ce7a068c3 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -10,7 +10,7 @@ struct fwnode_handle;
 
 #define GPIO_BLOCK_SHIFT 5
 #define NMK_GPIO_PER_CHIP BIT(GPIO_BLOCK_SHIFT)
-#define NMK_MAX_BANKS DIV_ROUND_UP(512, NMK_GPIO_PER_CHIP)
+#define NMK_MAX_BANKS __KERNEL_DIV_ROUND_UP(512, NMK_GPIO_PER_CHIP)
 
 /* Register in the logic block */
 #define NMK_GPIO_DAT	0x00
diff --git a/include/linux/math.h b/include/linux/math.h
index 0198c92cbe3e..6f541d765d8a 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_MATH_H
 #define _LINUX_MATH_H
 
+#include <linux/log2.h>
 #include <linux/types.h>
 #include <asm/div64.h>
 #include <uapi/linux/kernel.h>
@@ -46,7 +47,10 @@
 #define DIV_ROUND_UP_POW2(n, d) \
 	((n) / (d) + !!((n) & ((d) - 1)))
 
-#define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
+#define DIV_ROUND_UP(n, d)						\
+	(__builtin_constant_p(d) && is_power_of_2(d)			\
+		? DIV_ROUND_UP_POW2(n, d)				\
+		: __KERNEL_DIV_ROUND_UP(n, d))
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
 	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..652edb86f379 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1880,7 +1880,8 @@ struct mem_section {
 #endif
 
 #define SECTION_NR_TO_ROOT(sec)	((sec) / SECTIONS_PER_ROOT)
-#define NR_SECTION_ROOTS	DIV_ROUND_UP(NR_MEM_SECTIONS, SECTIONS_PER_ROOT)
+#define NR_SECTION_ROOTS	__KERNEL_DIV_ROUND_UP(NR_MEM_SECTIONS, \
+						      SECTIONS_PER_ROOT)
 #define SECTION_ROOT_MASK	(SECTIONS_PER_ROOT - 1)
 
 #ifdef CONFIG_SPARSEMEM_EXTREME
diff --git a/include/linux/nfs4.h b/include/linux/nfs4.h
index 71fbebfa43c7..8141f70e29b1 100644
--- a/include/linux/nfs4.h
+++ b/include/linux/nfs4.h
@@ -820,8 +820,7 @@ enum pnfs_update_layout_reason {
 	PNFS_UPDATE_LAYOUT_EXIT,
 };
 
-#define NFS4_OP_MAP_NUM_LONGS					\
-	DIV_ROUND_UP(LAST_NFS4_OP, 8 * sizeof(unsigned long))
+#define NFS4_OP_MAP_NUM_LONGS BITS_TO_LONGS(LAST_NFS4_OP)
 #define NFS4_OP_MAP_NUM_WORDS \
 	(NFS4_OP_MAP_NUM_LONGS * sizeof(unsigned long) / sizeof(u32))
 struct nfs4_op_map {
diff --git a/include/linux/rcu_node_tree.h b/include/linux/rcu_node_tree.h
index 78feb8ba7358..3fb40bbb0455 100644
--- a/include/linux/rcu_node_tree.h
+++ b/include/linux/rcu_node_tree.h
@@ -61,7 +61,7 @@
 #elif NR_CPUS <= RCU_FANOUT_2
 #  define RCU_NUM_LVLS	      2
 #  define NUM_RCU_LVL_0	      1
-#  define NUM_RCU_LVL_1	      DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_1)
+#  define NUM_RCU_LVL_1	      __KERNEL_DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_1)
 #  define NUM_RCU_NODES	      (NUM_RCU_LVL_0 + NUM_RCU_LVL_1)
 #  define NUM_RCU_LVL_INIT    { NUM_RCU_LVL_0, NUM_RCU_LVL_1 }
 #  define RCU_NODE_NAME_INIT  { "rcu_node_0", "rcu_node_1" }
@@ -69,8 +69,8 @@
 #elif NR_CPUS <= RCU_FANOUT_3
 #  define RCU_NUM_LVLS	      3
 #  define NUM_RCU_LVL_0	      1
-#  define NUM_RCU_LVL_1	      DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_2)
-#  define NUM_RCU_LVL_2	      DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_1)
+#  define NUM_RCU_LVL_1	      __KERNEL_DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_2)
+#  define NUM_RCU_LVL_2	      __KERNEL_DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_1)
 #  define NUM_RCU_NODES	      (NUM_RCU_LVL_0 + NUM_RCU_LVL_1 + NUM_RCU_LVL_2)
 #  define NUM_RCU_LVL_INIT    { NUM_RCU_LVL_0, NUM_RCU_LVL_1, NUM_RCU_LVL_2 }
 #  define RCU_NODE_NAME_INIT  { "rcu_node_0", "rcu_node_1", "rcu_node_2" }
@@ -78,9 +78,9 @@
 #elif NR_CPUS <= RCU_FANOUT_4
 #  define RCU_NUM_LVLS	      4
 #  define NUM_RCU_LVL_0	      1
-#  define NUM_RCU_LVL_1	      DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_3)
-#  define NUM_RCU_LVL_2	      DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_2)
-#  define NUM_RCU_LVL_3	      DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_1)
+#  define NUM_RCU_LVL_1	      __KERNEL_DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_3)
+#  define NUM_RCU_LVL_2	      __KERNEL_DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_2)
+#  define NUM_RCU_LVL_3	      __KERNEL_DIV_ROUND_UP(NR_CPUS, RCU_FANOUT_1)
 #  define NUM_RCU_NODES	      (NUM_RCU_LVL_0 + NUM_RCU_LVL_1 + NUM_RCU_LVL_2 + NUM_RCU_LVL_3)
 #  define NUM_RCU_LVL_INIT    { NUM_RCU_LVL_0, NUM_RCU_LVL_1, NUM_RCU_LVL_2, NUM_RCU_LVL_3 }
 #  define RCU_NODE_NAME_INIT  { "rcu_node_0", "rcu_node_1", "rcu_node_2", "rcu_node_3" }
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index f88daaa76d83..59989f26ed6b 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -88,7 +88,7 @@ static inline unsigned int tcp_optlen(const struct sk_buff *skb)
 
 /* TCP Fast Open Cookie as stored in memory */
 struct tcp_fastopen_cookie {
-	__le64	val[DIV_ROUND_UP(TCP_FASTOPEN_COOKIE_MAX, sizeof(u64))];
+	__le64	val[__KERNEL_DIV_ROUND_UP(TCP_FASTOPEN_COOKIE_MAX, sizeof(u64))];
 	s8	len;
 	bool	exp;	/* In RFC6994 experimental option format */
 };
diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 363d7dd2255a..e9f6d37ca2d5 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5723,7 +5723,7 @@ struct wiphy {
 	u16 max_acl_mac_addrs;
 
 	u32 flags, regulatory_flags, features;
-	u8 ext_features[DIV_ROUND_UP(NUM_NL80211_EXT_FEATURES, 8)];
+	u8 ext_features[__KERNEL_DIV_ROUND_UP(NUM_NL80211_EXT_FEATURES, 8)];
 
 	u32 ap_sme_capa;
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index bcb09e011e9e..a75280e57903 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -464,7 +464,7 @@ int sysctl_perf_event_mlock __read_mostly = 512 + (PAGE_SIZE / 1024); /* 'free'
 
 int sysctl_perf_event_sample_rate __read_mostly	= DEFAULT_MAX_SAMPLE_RATE;
 
-static int max_samples_per_tick __read_mostly	= DIV_ROUND_UP(DEFAULT_MAX_SAMPLE_RATE, HZ);
+static int max_samples_per_tick __read_mostly	= __KERNEL_DIV_ROUND_UP(DEFAULT_MAX_SAMPLE_RATE, HZ);
 static int perf_sample_period_ns __read_mostly	= DEFAULT_SAMPLE_PERIOD_NS;
 
 static int perf_sample_allowed_ns __read_mostly =
diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 82b884b67152..d5cc164088e5 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -529,8 +529,8 @@ static int swap_writer_finish(struct swap_map_handle *handle,
 #define UNC_SIZE	(UNC_PAGES * PAGE_SIZE)
 
 /* Number of pages we need for compressed data (worst case). */
-#define CMP_PAGES	DIV_ROUND_UP(bytes_worst_compress(UNC_SIZE) + \
-				CMP_HEADER, PAGE_SIZE)
+#define CMP_PAGES	__KERNEL_DIV_ROUND_UP(bytes_worst_compress(UNC_SIZE) + \
+					      CMP_HEADER, PAGE_SIZE)
 #define CMP_SIZE	(CMP_PAGES * PAGE_SIZE)
 
 /* Maximum number of threads for compression/decompression. */
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 59314da5eb60..b99a0c64c543 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -144,7 +144,7 @@ static struct rcu_tasks rt_name =							\
 	.call_func = call,								\
 	.wait_state = TASK_UNINTERRUPTIBLE,						\
 	.rtpcpu = &rt_name ## __percpu,							\
-	.lazy_jiffies = DIV_ROUND_UP(HZ, 4),						\
+	.lazy_jiffies = __KERNEL_DIV_ROUND_UP(HZ, 4),					\
 	.name = n,									\
 	.percpu_enqueue_shift = order_base_2(CONFIG_NR_CPUS),				\
 	.percpu_enqueue_lim = 1,							\
diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..4777d5fe0185 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -92,7 +92,7 @@
 #define BCH_ECC_WORDS(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 32)
 #define BCH_ECC_BYTES(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 8)
 
-#define BCH_ECC_MAX_WORDS      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 32)
+#define BCH_ECC_MAX_WORDS      __KERNEL_DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 32)
 
 #ifndef dbg
 #define dbg(_fmt, args...)     do {} while (0)
diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65a75d58ed9e..df34bb85fd88 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -693,8 +693,8 @@ static void __init test_bitmap_arr32(void)
 		}
 
 		if (nbits < EXP1_IN_BITS - 32)
-			expect_eq_uint(arr[DIV_ROUND_UP(nbits, 32)],
-								0xa5a5a5a5);
+			expect_eq_uint(arr[__KERNEL_DIV_ROUND_UP(nbits, 32)],
+				       0xa5a5a5a5);
 	}
 }
 
@@ -728,7 +728,8 @@ static void __init test_bitmap_arr64(void)
 		}
 
 		if (nbits < EXP1_IN_BITS - 64)
-			expect_eq_uint(arr[DIV_ROUND_UP(nbits, 64)], 0xa5a5a5a5);
+			expect_eq_uint(arr[__KERNEL_DIV_ROUND_UP(nbits, 64)],
+				       0xa5a5a5a5);
 	}
 }
 
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 6d0e47f7ae33..5b4ec6900999 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -128,8 +128,9 @@
  *  (reason above)
  */
 #define ZS_SIZE_CLASS_DELTA	(PAGE_SIZE >> CLASS_BITS)
-#define ZS_SIZE_CLASSES	(DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
-				      ZS_SIZE_CLASS_DELTA) + 1)
+#define ZS_SIZE_CLASSES	(__KERNEL_DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE -	\
+					       ZS_MIN_ALLOC_SIZE,	\
+					       ZS_SIZE_CLASS_DELTA) + 1)
 
 /*
  * Pages are distinguished by the ratio of used memory (that is the ratio
diff --git a/net/ethtool/bitset.c b/net/ethtool/bitset.c
index f0883357d12e..abce56a56801 100644
--- a/net/ethtool/bitset.c
+++ b/net/ethtool/bitset.c
@@ -734,7 +734,7 @@ int ethnl_parse_bitset(unsigned long *val, unsigned long *mask,
  * majority of bitmaps used by ethtool.
  */
 #define ETHNL_SMALL_BITMAP_BITS 128
-#define ETHNL_SMALL_BITMAP_WORDS DIV_ROUND_UP(ETHNL_SMALL_BITMAP_BITS, 32)
+#define ETHNL_SMALL_BITMAP_WORDS BITS_TO_U32(ETHNL_SMALL_BITMAP_BITS)
 
 int ethnl_bitset_size(const unsigned long *val, const unsigned long *mask,
 		      unsigned int nbits, ethnl_string_array_t names,
diff --git a/net/ethtool/common.h b/net/ethtool/common.h
index 850eadde4bfc..9635589e9d1c 100644
--- a/net/ethtool/common.h
+++ b/net/ethtool/common.h
@@ -6,7 +6,7 @@
 #include <linux/netdevice.h>
 #include <linux/ethtool.h>
 
-#define ETHTOOL_DEV_FEATURE_WORDS	DIV_ROUND_UP(NETDEV_FEATURE_COUNT, 32)
+#define ETHTOOL_DEV_FEATURE_WORDS	BITS_TO_U32(NETDEV_FEATURE_COUNT)
 
 /* compose link mode index from speed, type and duplex */
 #define ETHTOOL_LINK_MODE(speed, type, duplex) \
diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 34bee42e1247..0406b5706133 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -421,7 +421,7 @@ convert_link_ksettings_to_legacy_settings(
 
 /* number of 32-bit words to store the user's link mode bitmaps */
 #define __ETHTOOL_LINK_MODE_MASK_NU32			\
-	DIV_ROUND_UP(__ETHTOOL_LINK_MODE_MASK_NBITS, 32)
+	BITS_TO_U32(__ETHTOOL_LINK_MODE_MASK_NBITS)
 
 /* layout of the struct passed from/to userland */
 struct ethtool_link_usettings {
diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index c61df637232a..e17d5d63b055 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -16,7 +16,7 @@
 /* Number of kilo-symbols (symbols * 1024) for a packet with (bps) bits per
  * symbol. We use k-symbols to avoid rounding in the _TIME macros below.
  */
-#define MCS_N_KSYMS(bps) DIV_ROUND_UP(MCS_NBITS << 10, (bps))
+#define MCS_N_KSYMS(bps) __KERNEL_DIV_ROUND_UP(MCS_NBITS << 10, (bps))
 
 /* Transmission time (in 1024 * usec) for a packet containing (ksyms) * 1024
  * symbols.
diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index 706cbc99f718..271ec1c6ad4f 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -23,7 +23,7 @@
 #define MCS_NBITS ((AVG_PKT_SIZE * AVG_AMPDU_SIZE) << 3)
 
 /* Number of symbols for a packet with (bps) bits per symbol */
-#define MCS_NSYMS(bps) DIV_ROUND_UP(MCS_NBITS, (bps))
+#define MCS_NSYMS(bps) __KERNEL_DIV_ROUND_UP(MCS_NBITS, (bps))
 
 /* Transmission time (nanoseconds) for a packet containing (syms) symbols */
 #define MCS_SYMBOL_TIME(sgi, syms)					\
diff --git a/security/selinux/ss/sidtab.h b/security/selinux/ss/sidtab.h
index 832c85c70d83..53082a3c1453 100644
--- a/security/selinux/ss/sidtab.h
+++ b/security/selinux/ss/sidtab.h
@@ -50,8 +50,9 @@ union sidtab_entry_inner {
 #define SIDTAB_MAX	U32_MAX
 /* ensure enough tree levels for SIDTAB_MAX entries */
 #define SIDTAB_MAX_LEVEL                                                   \
-	DIV_ROUND_UP(SIDTAB_MAX_BITS - size_to_shift(SIDTAB_LEAF_ENTRIES), \
-		     SIDTAB_INNER_SHIFT)
+	__KERNEL_DIV_ROUND_UP(SIDTAB_MAX_BITS -				   \
+			      size_to_shift(SIDTAB_LEAF_ENTRIES),	   \
+			      SIDTAB_INNER_SHIFT)
 
 struct sidtab_node_leaf {
 	struct sidtab_entry entries[SIDTAB_LEAF_ENTRIES];
diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 4f6b20ed29dd..ba3743cff639 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -36,7 +36,7 @@ MODULE_LICENSE("GPL v2");
 #define DEFAULT_QUEUE_LENGTH	21
 
 #define MAX_PACKET_SIZE		672 /* hardware specific */
-#define MAX_MEMORY_BUFFERS	DIV_ROUND_UP(MAX_QUEUE_LENGTH, \
+#define MAX_MEMORY_BUFFERS	__KERNEL_DIV_ROUND_UP(MAX_QUEUE_LENGTH, \
 					     PAGE_SIZE / MAX_PACKET_SIZE)
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
-- 
2.43.0


