namespace sharpList.Services;

public class HousesService
{
  private readonly HousesRepository _repo;
  public HousesService(HousesRepository repo)
  {
    _repo = repo;
  }

  internal House CreateHouse(House houseData)
  {
    House house = _repo.CreateHouse(houseData);
    return house;
  }

  internal List<House> GetAllHouses()
  {
    List<House> houses = _repo.GetAllHouses();
    return houses;
  }

  internal House GetById(int houseId)
  {
    House house = _repo.GetById(houseId);
    if (house == null) throw new Exception($"no house at Id: {houseId}");
    return house;
  }

  internal string RemoveHouse(int houseId)
  {
    House house = GetById(houseId);
    int rows = _repo.RemoveHouse(houseId);
    if (rows > 1) throw new Exception("Not gonna happen, bub");
    return $"Deleted..";
  }

  internal House UpdateHouse(House updateData)
  {
    House original = GetById(updateData.Id);
    original.Color = updateData.Color != null ? updateData.Color : original.Color;
    original.Bathrooms = updateData.Bathrooms != null ? updateData.Bathrooms : original.Bathrooms;
    original.Bedrooms = updateData.Bedrooms != null ? updateData.Bedrooms : original.Bedrooms;
    _repo.UpdateHouse(original);
    return original;
  }
}