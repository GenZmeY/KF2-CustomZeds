class WMPawn_ZedCrawler_Ultra extends WMPawn_ZedCrawler_NoElite;

var const float ExtraDamageResistance;

static function string GetLocalizedName()
{
	return class'WMPawn_ZedConstants'.default.UltraString @ super.GetLocalizedName();
}

simulated function PostBeginPlay()
{
	IntendedBodyScale = 2.0f;

	super.PostBeginPlay();
}

function float GetDamageTypeModifier(class<DamageType> DT)
{
	local float CurrentMod;

	CurrentMod = super.GetDamageTypeModifier(DT);
	return FMax(0.025f, CurrentMod - ExtraDamageResistance);
}

defaultproperties
{
	DifficultySettings=class'WMDifficulty_Crawler_Big'

	bKnockdownWhenJumpedOn=False
	DoshValue=48
	Health=530
	Mass=450.0f
	GroundSpeed=270.0f
	SprintSpeed=325.0f
	ExtraDamageResistance=0.65f

	XPValues(0)=20
	XPValues(1)=25
	XPValues(2)=25
	XPValues(3)=25

	HitZones(0)=(GoreHealth=300)

	Name="Default__WMPawn_ZedCrawler_Ultra"
}
