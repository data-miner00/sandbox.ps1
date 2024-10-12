function Initialize-Object {
    Param(
        [string]$Name,
        [DateTime]$Birthday
    )

    begin {
        if($null -eq (Get-TypeData 'Animals.Dog')) {
            Add-Type @"
using System;

namespace Animals
{
    public class Dog
    {
        public string Name { get; set; }
        public DateTime Birthday { get; set; }
        public House House { get; set; }

        public Dog()
        {
            this.House = new House("Maebashi", "Japan");
        }

        public string Greet()
        {
            var returnValue = string.Format("Name: {0}\nHouse: {1}", this.Name, this.House.ToString());
            return returnValue;
        }
    }

    public sealed class House
    {
        public string City { get; set; }
        public string Country { get; set; }
        
        public House(string city, string country)
        {
            this.City = city;
            this.Country = country;
        }

        public override string ToString()
        {
            return string.Format("House is in {0}, {1}.", this.City, this.Country);
        }
    }
}
"@

            # string interpolation with $ is not allowed
        }
    }

    process {
        $spot = New-Object 'Animals.Dog'
        $spot.Name = $Name
        $spot.Birthday = $Birthday
        Write-Host $spot.Greet()

        $spot.Name = "Spoty"
        Write-Host $spot.Greet()
    }
}

Initialize-Object -Name spoonge -Birthday ([datetime]::Now)