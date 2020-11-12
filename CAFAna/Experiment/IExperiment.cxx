#include "CAFAna/Experiment/IExperiment.h"

#include "CAFAna/Core/LoadFromRegistry.h"

#include "TFile.h"
#include "TObjString.h"

#include <iostream>

namespace ana
{
  // TODO
  template<class T> std::unique_ptr<T> LoadFrom(TDirectory* dir, const std::string& name);

  //----------------------------------------------------------------------
  // Definition to satisfy declaration in Core/LoadFromFile.h
  template<> std::unique_ptr<IExperiment> LoadFrom<IExperiment>(TDirectory* dir, const std::string& name)
  {
    TObjString* ptag = (TObjString*)dir->Get((name+"/type").c_str());
    assert(ptag);

    const TString tag = ptag->GetString();
    delete ptag;

    const auto func = LoadFromRegistry<IExperiment>::Get(tag.Data());
    if(func) return func(dir, name);

    std::cerr << "Unknown Experiment type '" << tag << "'" << std::endl;
    abort();
  }

  //----------------------------------------------------------------------
  void IExperiment::SaveTo(TDirectory* dir, const std::string& name) const
  {
    assert(0 && "Not implemented");
  }
}
