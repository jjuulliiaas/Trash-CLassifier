enum TrashCategory {
  battery,
  biological,
  cardboard,
  clothes,
  glass,
  metal,
  paper,
  plastic,
  shoes,
  trash,
  unknow
}

TrashCategory categoryFromLabel(String label) {
  switch (label.toLowerCase()) {
    case 'battery':
      return TrashCategory.battery;
    case 'biological':
      return TrashCategory.biological;
    case 'cardboard':
      return TrashCategory.cardboard;
    case 'clothes':
      return TrashCategory.clothes;
    case 'glass':
      return TrashCategory.glass;
    case 'metal':
      return TrashCategory.metal;
    case 'paper':
      return TrashCategory.paper;
    case 'plastic':
      return TrashCategory.plastic;
    case 'shoes':
      return TrashCategory.shoes;
    case 'trash':
      return TrashCategory.trash;
    default:
      return TrashCategory.unknow;
  }
}

