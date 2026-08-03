import "./CategoryRow.css";

import HubTile from "./HubTile";
import Tile from "./Tile";

export interface ServiceItem {
  id: string;
  title: string;
  icon: string;
  color: string;
}

interface CategoryRowProps {
  id: string;
  title: string;
  icon: string;
  services: ServiceItem[];
  expanded: boolean;
  hubBackground: string;
  hubTextColor: string;
  hubAccentColor: string;
  onToggle: () => void;
  onServiceClick: (service: ServiceItem) => void;
  visibleServiceCount?: number;
}

export default function CategoryRow({
  id,
  title,
  icon,
  services,
  expanded,
  hubBackground,
  hubTextColor,
  hubAccentColor,
  onToggle,
  onServiceClick,
  visibleServiceCount = 3,
}: CategoryRowProps) {
  const displayedServices = expanded
    ? services
    : services.slice(0, visibleServiceCount);

  const serviceRowCount = Math.max(
    1,
    Math.ceil(displayedServices.length / visibleServiceCount),
  );

  return (
    <section
      className="category-row"
      aria-label={`${title} services`}
    >
      <HubTile
        id={`${id}-hub`}
        title={title}
        icon={icon}
        serviceCount={services.length}
        visibleServiceCount={visibleServiceCount}
        expanded={expanded}
        rowSpan={serviceRowCount}
        backgroundColor={hubBackground}
        textColor={hubTextColor}
        accentColor={hubAccentColor}
        onClick={onToggle}
      />

      {displayedServices.map((service) => (
        <Tile
          key={service.id}
          id={service.id}
          title={service.title}
          icon={service.icon}
          width={3}
          color={service.color}
          onClick={() => onServiceClick(service)}
        />
      ))}
    </section>
  );
}