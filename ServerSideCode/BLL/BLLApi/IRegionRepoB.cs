﻿using BLL.BLLModels;
using DAL.DALModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLLApi;

public interface IRegionRepoB
{
    Task<List<RegionB>> GetAllRegionsAsync();
}
