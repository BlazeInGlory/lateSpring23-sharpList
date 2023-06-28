namespace sharpList.Repositories;

public class HousesRepository
{
  private readonly IDbConnection _db;
  public HousesRepository(IDbConnection db)
  {
    _db = db;
  }

  internal House CreateHouse(House houseData)
  {
    string sql = @"
    INSERT INTO houses
    (year, price, color, bathrooms, bedrooms, description)
    VALUES
    (@year, @price, @color, @bathrooms, @bedrooms, @description);
    SELECT * FROM houses WHERE id = LAST_INSERT_ID();";
    House house = _db.Query<House>(sql, houseData).FirstOrDefault();
    return house;
  }

  internal List<House> GetAllHouses()
  {
    string sql = "SELECT * FROM houses ORDER BY createdAt DESC;";
    List<House> houses = _db.Query<House>(sql).ToList();
    return houses;
  }

  internal House GetById(int houseId)
  {
    string sql = "SELECT * FROM houses WHERE id = @houseId;";
    House house = _db.Query<House>(sql, new { houseId }).FirstOrDefault();
    return house;
  }

  internal int RemoveHouse(int houseId)
  {
    string sql = "DELETE FROM houses WHERE id = @houseId LIMIT 1;";
    int rows = _db.Execute(sql, new { houseId });
    return rows;
  }

  internal void UpdateHouse(House updateData)
  {
    string sql = @"
    UPDATE houses SET
    year = @year,
    price = @price,
    color = @color,
    bathrooms = @bathrooms,
    bedrooms = @bedrooms,
    description = @description
    WHERE id = @id;";
    _db.Execute(sql, updateData);
  }
}

// year, price, color, bathrooms, bedrooms, description
