#!/usr/bin/perl

#USAGE: perl 15_map.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het

my $pedigree = $ARGV[0]; #GF18

my $working_dir = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het";

# nap
open FILE1, "$working_dir/input_samples_details/input_nap.txt" or die "cannot open file nap.txt"; #search contorl file

my %hashcontrol;
while (my $line1=<FILE1>) {
chomp($line1);
#my($a1,$a2) = split /\t/, $line1;
#my $cont = "$a1:$a2"; #get 3 and 4 coloum
$hashcontrol{$line1} = '';
#   #print "$line1\n";
#  print "$cont\n";
}

# map
open FILE2, "$working_dir/input_samples_details/input_map.txt" or die "cannot open file map.txt"; #search contorl file

#my %hashcontrol;
while (my $line2=<FILE2>) {
chomp($line2);
#my($a1,$a2) = split /\t/, $line1;
#my $cont = "$a1:$a2"; #get 3 and 4 coloum
$hashcontrol{$line2} = '';
#   #print "$line1\n";
#  print "$cont\n";
}

#while ( (my $l) = each %hashcontrol ) {
#    print "$l\n";
#}

open(my $outfile, ">","$working_dir/processed_files/ped.$pedigree.map") or die "cannot open file nap";

print {$outfile}"#Chr\tStart\tEnd\tRef\tAlt\tFunc.refGene\tGene.refGene\tGeneDetail.refGene\tExonicFunc.refGene\tAAChange.refGene\tcytoBand\tgenomicSuperDups\tesp6500siv2_ea\t1000g2015aug_all\t1000g2015aug_afr\t1000g2015aug_amr\t1000g2015aug_eas\t1000g2015aug_eur\t1000g2015aug_sas\tExAC_ALL\tExAC_AFR\tExAC_AMR\tExAC_EAS\tExAC_FIN\tExAC_NFE\tExAC_OTH\tExAC_SAS\tavsnp150\tCLNALLELEID\tCLNDN\tCLNDISDB\tCLNREVSTAT\tCLNSIG\tAF\tAF_popmax\tAF_male\tAF_female\tAF_raw\tAF_afr\tAF_sas\tAF_amr\tAF_eas\tAF_nfe\tAF_fin\tAF_asj\tAF_oth\tnon_topmed_AF_popmax\tnon_neuro_AF_popmax\tnon_cancer_AF_popmax\tcontrols_AF_popmax\tREVEL\tSIFT_score\tSIFT_converted_rankscore\tSIFT_pred\tPolyphen2_HDIV_score\tPolyphen2_HDIV_rankscore\tPolyphen2_HDIV_pred\tPolyphen2_HVAR_score\tPolyphen2_HVAR_rankscore\tPolyphen2_HVAR_pred\tLRT_score\tLRT_converted_rankscore\tLRT_pred\tMutationTaster_score\tMutationTaster_converted_rankscore\tMutationTaster_pred\tMutationAssessor_score\tMutationAssessor_score_rankscore\tMutationAssessor_pred\tFATHMM_score\tFATHMM_converted_rankscore\tFATHMM_pred\tPROVEAN_score\tPROVEAN_converted_rankscore\tPROVEAN_pred\tVEST3_score\tVEST3_rankscore\tMetaSVM_score\tMetaSVM_rankscore\tMetaSVM_pred\tMetaLR_score\tMetaLR_rankscore\tMetaLR_pred\tM-CAP_score\tM-CAP_rankscore\tM-CAP_pred\tCADD_raw\tCADD_raw_rankscore\tCADD_phred\tDANN_score\tDANN_rankscore\tfathmm-MKL_coding_score\tfathmm-MKL_coding_rankscore\tfathmm-MKL_coding_pred\tEigen_coding_or_noncoding\tEigen-raw\tEigen-PC-raw\tGenoCanyon_score\tGenoCanyon_score_rankscore\tintegrated_fitCons_score\tintegrated_fitCons_score_rankscore\tintegrated_confidence_value\tGERP++_RS\tGERP++_RS_rankscore\tphyloP100way_vertebrate\tphyloP100way_vertebrate_rankscore\tphyloP20way_mammalian\tphyloP20way_mammalian_rankscore\tphastCons100way_vertebrate\tphastCons100way_vertebrate_rankscore\tphastCons20way_mammalian\tphastCons20way_mammalian_rankscore\tSiPhy_29way_logOdds\tSiPhy_29way_logOdds_rankscore\tInterpro_domain\tGTEx_V6_gene\tGTEx_V6_tissue\tOtherinfo\tOtherinfo2\tOtherinfo3\tOtherinfo4\tOtherinfo5\tOtherinfo6\tOtherinfo7\tOtherinfo8\tOtherinfo9\tOtherinfo10\tOtherinfo11\tOtherinfo12\tOtherinfo13\tref_depth\talt_depth\tper_33_ad\tHet_Hom\tfamily_number\tsample_number\n";

open FILE, "$working_dir/processed_files/ped.$pedigree.map.con" or die;

 while (my $line=<FILE>)

      {
      chomp($line);
      my(@array) = split /\t/, $line;
    	my $case = "$array[135]"; #get 3 and 4 coloum
			# print "$case\n";

         if(exists ($hashcontrol{$case}))
         {
         print {$outfile}"$line\n";
         }#else
         	#{
       		#  print "$line2\n";
         	#}
      }
