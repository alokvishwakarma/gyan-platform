import "./ReservedShopClaimContent.css";

interface ReservedShopClaimContentProps {
  shopCode: string;
  onClaim: () => void;
  onBack: () => void;
}

export default function ReservedShopClaimContent({
  shopCode,
  onClaim,
  onBack,
}: ReservedShopClaimContentProps) {
  return (
    <section className="reserved-shop-claim">
      <div className="reserved-shop-claim__badge">🏪</div>
      <small>GYAN RESERVED SHOP QR</small>
      <h1>Claim your GYAN shop</h1>
      <p>
        This permanent QR code was issued by GYAN for a new shop.
        Register the shop once and keep using the same QR.
      </p>

      <div className="reserved-shop-claim__code">
        <span>Permanent shop code</span>
        <strong>{shopCode}</strong>
      </div>

      <button
        type="button"
        className="reserved-shop-claim__primary"
        onClick={onClaim}
      >
        Claim this shop
      </button>

      <button
        type="button"
        className="reserved-shop-claim__secondary"
        onClick={onBack}
      >
        Back to GYAN
      </button>
    </section>
  );
}
