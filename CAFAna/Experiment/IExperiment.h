#pragma once

#include "CAFAna/Core/FwdDeclare.h"
#include "CAFAna/Core/StanVar.h"

#include "OscLib/IOscCalc.h"
namespace osc{typedef _IOscCalcAdjustable<stan::math::var> IOscCalcAdjustableStan;}

#include <cassert>

class TDirectory;

namespace ana
{
  // TODO
  class SystShifts;
  extern SystShifts kNoShift;

  /// Base class defining interface for experiments
  class IExperiment
  {
  public:
    virtual ~IExperiment() {}
    virtual double ChiSq(osc::IOscCalcAdjustable* osc,
                         const SystShifts& syst = kNoShift) const
    {
      assert(false && "unimplemented");
      return 0;
    };

    virtual stan::math::var LogLikelihood(osc::IOscCalcAdjustableStan *osc,
                                          const SystShifts &syst = kNoShift) const
    {
      assert(false && "unimplemented");
      return 0;
    };

    virtual void SaveTo(TDirectory *dir, const std::string &name) const;
  };
}
