type HeroTileProps = {
  title: string;
  subtitle: string;
};

export default function HeroTile({
  title,
  subtitle,
}: HeroTileProps) {
  return (
    <section className="hero-tile">
      <div className="hero-icon">📖</div>

      <h1>{title}</h1>

      <p>{subtitle}</p>
    </section>
  );
}