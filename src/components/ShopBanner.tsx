import "./ShopBanner.css";

interface ShopBannerProps {
  shopName?: string;
  address?: string;
  onRegisterShop?: () => void;
}

export default function ShopBanner({
  shopName,
  address,
  onRegisterShop,
}: ShopBannerProps) {
  const hasShop = Boolean(shopName && address);

  return (
    <section
      className="shop-banner"
      aria-label={
        hasShop
          ? `${shopName}, ${address}`
          : "Register your shop"
      }
    >
      {hasShop ? (
        <div className="shop-banner__identity">
          <strong>{shopName?.toUpperCase()}</strong>
          <span>{address}</span>
        </div>
      ) : (
        <button
          type="button"
          className="shop-banner__register"
          onClick={onRegisterShop}
        >
          <strong>Register your shop</strong>
          <span>Join the GYAN network</span>
        </button>
      )}
    </section>
  );
}